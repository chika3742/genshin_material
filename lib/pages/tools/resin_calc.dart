import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:timeago/timeago.dart" as timeago;

import "../../components/game_data_sync_indicator.dart";
import "../../components/list_subheader.dart";
import "../../composables/use_periodic_timer.dart";
import "../../i18n/strings.g.dart";
import "../../providers/game_data_sync.dart";
import "../../providers/preferences.dart";
import "../../ui_core/layout.dart";
import "../../utils/resin_calculator.dart";

class ResinCalcPage extends HookConsumerWidget {
  const ResinCalcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final resinController = useTextEditingController(text: prefs.resin?.toString() ?? "");
    final resinInput = useValueListenable(resinController);

    useEffect(() {
      if (prefs.isLinkedWithHoyolab) {
        ref.read(resinSyncStateNotifierProvider.notifier).syncResin();
      }
      return null;
    }, [prefs.isLinkedWithHoyolab, prefs.syncResin],);
    useEffect(() {
      if (prefs.isLinkedWithHoyolab) {
        resinController.text = prefs.resin?.toString() ?? "";
      }
      return null;
    }, [prefs.resin],);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr.pages.resinCalc),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: GappedColumn(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: resinController,
                            keyboardType: TextInputType.number,
                            enabled: !prefs.isLinkedWithHoyolab || !prefs.syncResin,
                            decoration: InputDecoration(
                              labelText: tr.resinCalcPage.currentResin,
                              border: const OutlineInputBorder(),
                              suffixText: "/ $maxResin",
                              suffixIcon: resinInput.text.isNotEmpty ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  resinController.clear();
                                  ref.read(preferencesStateNotifierProvider.notifier).setResin(null);
                                },
                              ) : null,
                            ),
                            inputFormatters: [
                              TextInputFormatter.withFunction((oldValue, newValue) {
                                if ((int.tryParse(newValue.text) ?? 0) >= maxResin) {
                                  return TextEditingValue(text: maxResin.toString());
                                }
                                return newValue;
                              }),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            onChanged: (value) {
                              final prefNotifier = ref.read(preferencesStateNotifierProvider.notifier);
                              if (value.isNotEmpty) {
                                final resin = int.tryParse(value);
                                if (resin == null) {
                                  return;
                                }
                                prefNotifier.setResin(resin);
                              } else {
                                prefNotifier.setResin(null);
                              }
                            },
                          ),
                        ),
                        if (prefs.syncResin && prefs.isLinkedWithHoyolab) Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Consumer(
                            builder: (context, ref, _) {
                              return GameDataSyncIndicator(
                                status: ref.watch(resinSyncStateNotifierProvider),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const _CalcResultTable(),

                    const SizedBox(height: 8), // 24px spacing (GappedColumn)
                    ListSubheader(tr.resinCalcPage.howToUse, padding: EdgeInsets.zero),
                    Text(tr.resinCalcPage.howToUseContent),

                    ListSubheader(tr.pages.settings, padding: EdgeInsets.zero),
                    OverflowBox(
                      fit: OverflowBoxFit.deferToChild,
                      maxWidth: MediaQuery.of(context).size.width,
                      child: SwitchListTile(
                        title: Text(tr.hoyolab.syncResin),
                        value: prefs.syncResin,
                        onChanged: prefs.isLinkedWithHoyolab ? (value) {
                          ref.read(preferencesStateNotifierProvider.notifier).setSyncResin(value);
                          if (value) {
                            ref.read(resinSyncStateNotifierProvider.notifier).syncResin();
                          }
                        } : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CalcResult extends HookWidget {
  const _CalcResult();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class _CalcResultTable extends HookConsumerWidget {
  const _CalcResultTable();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For rebuilding results every second
    final currentTime = useState(DateTime.now());
    usePeriodicTimer(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });

    final prefs = ref.watch(preferencesStateNotifierProvider);

    ResinCalculationResult? calcResult;
    if (prefs.resin != null && prefs.resinBaseTime != null) {
      calcResult = calculateResinRecovery(
        currentResin: prefs.resin!,
        baseTime: prefs.resinBaseTime!,
        maxResin: maxResin,
        minutesPerResin: minutesPerResinRecovery,
      );
    }

    return Column(
      children: [
        _buildRow(
          label: tr.resinCalcPage.baseTime,
          content: () {
            if (prefs.resinBaseTime == null) return const Text("-");
            return Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  _formatDateTime(prefs.resinBaseTime!),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "(${timeago.format(prefs.resinBaseTime!, locale: LocaleSettings.currentLocale.languageCode)})",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            );
          }(),
        ),
        const Divider(),
        _buildRow(
          label: calcResult != null && calcResult.timeToFull.isNegative
              ? tr.resinCalcPage.recoveredTime
              : tr.resinCalcPage.fullRecoveryTime,
          content: Text(calcResult != null ? _formatDateTime(calcResult.fullyReplenishedBy) : "-"),
        ),
        const SizedBox(height: 4),
        _buildRow(
          label: tr.resinCalcPage.untilFullRecovery,
          content: Text.rich(
            calcResult != null && !calcResult.timeToFull.isNegative
                ? _formatDuration(calcResult.timeToFull)
                : const TextSpan(text: "-"),
          ),
        ),
        const SizedBox(height: 4),
        _buildRow(
          label: tr.resinCalcPage.currentResin,
          content: Text(calcResult != null ? "${calcResult.currentResin} / $maxResin" : "-"),
        ),
        const SizedBox(height: 4),
        _buildRow(
          label: tr.resinCalcPage.wastedResin,
          content: Text(calcResult != null && calcResult.wastedResin >= 0 ? calcResult.wastedResin.toString() : "-"),
        ),

        if (calcResult != null && calcResult.currentResin == maxResin) Align(
          alignment: Alignment.centerRight,
          child: Text(
            tr.resinCalcPage.alreadyFull,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRow({required String label, required Widget content}) {
    final context = useContext();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              child: content,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final isToday = dateTime.day == DateTime.now().day;
    final isTomorrow = dateTime.day == DateTime.now().add(const Duration(days: 1)).day;
    final dateDisplay = () {
      if (isToday) {
        return "";
      }
      if (isTomorrow) {
        return "${tr.resinCalcPage.tomorrow} ";
      }
      return "${DateFormat("MMMd", LocaleSettings.currentLocale.languageCode).format(dateTime)} ";
    }();

    return "$dateDisplay${DateFormat("jm", LocaleSettings.currentLocale.languageCode).format(dateTime)}";
  }

  InlineSpan _formatDuration(Duration duration) {
    final parts = <InlineSpan>[];

    if (duration.inHours > 0) {
      parts.add(
        tr.common.hours(
          n: duration.inHours,
          nBuilder: (n) => TextSpan(text: n.toString()),
          unit: (unit) => TextSpan(text: unit, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        ),
      );
    }
    if (duration.inMinutes > 0) {
      parts.add(
        tr.common.minutes(
          n: duration.inMinutes.remainder(60),
          nBuilder: (n) => TextSpan(text: n.toString()),
          unit: (unit) => TextSpan(text: unit, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
        ),
      );
    }
    parts.add(
      tr.common.seconds(
        n: duration.inSeconds.remainder(60),
        nBuilder: (n) => TextSpan(text: n.toString()),
        unit: (unit) => TextSpan(text: unit, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),
      ),
    );

    return TextSpan(
      children: List.generate(parts.length * 2 - 1, (index) {
        if (index.isEven) {
          return parts[index ~/ 2];
        }
        return const TextSpan(text: " ");
      }),
    );
  }
}
