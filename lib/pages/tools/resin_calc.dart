import "package:firebase_remote_config/firebase_remote_config.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";

import "../../components/game_data_sync_indicator.dart";
import "../../components/list_subheader.dart";
import "../../composables/use_periodic_timer.dart";
import "../../constants/remote_config_key.dart";
import "../../core/pref_keys.dart";
import "../../i18n/strings.g.dart";
import "../../providers/game_data_sync.dart";
import "../../providers/hoyolab_credential.dart";
import "../../providers/pref_notifier.dart";
import "../../providers/resin.dart";
import "../../utils/resin_calculator.dart";

class ResinCalcPage extends HookConsumerWidget {
  const ResinCalcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resinSnapshot = ref.watch(resinProvider);
    final syncResin = ref.watch(prefProvider(PrefKeys.syncResin));
    final isLinked = ref.watch(isLinkedWithHoyolabProvider);

    final resinController = useTextEditingController(text: resinSnapshot.resin?.toString() ?? "");
    final resinInput = useValueListenable(resinController);

    useEffect(() {
      if (isLinked) {
        ref.read(resinSyncStateProvider.notifier).syncResin();
      }
      return null;
    }, [isLinked, syncResin]);
    useEffect(() {
      if (isLinked) {
        resinController.text = resinSnapshot.resin?.toString() ?? "";
      }
      return null;
    }, [resinSnapshot.resin]);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8.0,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: resinController,
                            keyboardType: TextInputType.number,
                            enabled: !isLinked || !syncResin,
                            decoration: InputDecoration(
                              labelText: tr.resinCalcPage.currentResin,
                              border: const OutlineInputBorder(),
                              suffixText: "/ $maxResin",
                              suffixIcon: resinInput.text.isNotEmpty ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  resinController.clear();
                                  ref.read(resinProvider.notifier).setResin(null);
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
                              final notifier = ref.read(resinProvider.notifier);
                              if (value.isNotEmpty) {
                                final resin = int.tryParse(value);
                                if (resin == null) {
                                  return;
                                }
                                notifier.setResin(resin);
                              } else {
                                notifier.setResin(null);
                              }
                            },
                          ),
                        ),
                        if (syncResin && isLinked) Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Consumer(
                            builder: (context, ref, _) {
                              return GameDataSyncIndicator(
                                status: ref.watch(resinSyncStateProvider),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const _CalcResult(),

                    const SizedBox(height: 8), // 24px spacing (GappedColumn)
                    ListSubheader(tr.resinCalcPage.howToUse, padding: EdgeInsets.zero),
                    Text(tr.resinCalcPage.howToUseContent),

                    if (FirebaseRemoteConfig.instance.getBool(RemoteConfigKey.hoyolabLinkEnabled))
                      ...[
                        ListSubheader(tr.pages.settings, padding: EdgeInsets.zero),
                        OverflowBox(
                          fit: OverflowBoxFit.deferToChild,
                          maxWidth: MediaQuery.of(context).size.width,
                          child: SwitchListTile(
                            title: Text(tr.hoyolab.syncResin),
                            value: syncResin,
                            onChanged: isLinked ? (value) {
                              ref.read(prefProvider(PrefKeys.syncResin).notifier).set(value);
                              if (value) {
                                ref.read(resinSyncStateProvider.notifier).syncResin();
                              }
                            } : null,
                          ),
                        ),
                      ],
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

class _CalcResult extends HookConsumerWidget {
  const _CalcResult();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For rebuilding results every second
    final currentTime = useState(DateTime.now());
    usePeriodicTimer(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });

    final resinSnapshot = ref.watch(resinProvider);

    ResinCalculationResult? calcResult;
    if (resinSnapshot.resin != null && resinSnapshot.baseTime != null) {
      calcResult = calculateResinRecovery(
        currentResin: resinSnapshot.resin!,
        baseTime: resinSnapshot.baseTime!,
        maxResin: maxResin,
        minutesPerResin: minutesPerResinRecovery,
      );
    }

    return Column(
      spacing: 16,
      children: [
        Row(
          children: [
            Image.asset("assets/img/resin.webp", width: 80, height: 80),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: calcResult?.currentResin.toString() ?? "-",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (calcResult != null && calcResult.wastedResin > 0)
                          TextSpan(
                            text: " + ${calcResult.wastedResin.toString()}",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const WidgetSpan(child: SizedBox(width: 16)),
                        const TextSpan(text: " / $maxResin\n"),

                        // line 2
                        tr.resinCalcPage.fullyReplenishedAt(
                          time: TextSpan(
                            text: calcResult != null ? _formatDateTime(calcResult.fullyReplenishedBy) : "-",
                          ),
                          text: (text) => TextSpan(
                            text: text,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        TextSpan(text: "\n"),

                        // line 3
                        calcResult != null && !calcResult.timeToFull.isNegative
                            ? tr.resinCalcPage.recoversIn(
                                time: _formatDuration(calcResult.timeToFull),
                                text: (text) => TextSpan(
                                  text: text,
                                  style: TextStyle(fontSize: 14),
                                ),
                              )
                            : TextSpan(
                                text: tr.resinCalcPage.alreadyFull,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                      ],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  if (resinSnapshot.baseTime != null)
                    Text.rich(
                      tr.resinCalcPage.asOf(
                        time: TextSpan(
                          text: _formatDateTime(resinSnapshot.baseTime!),
                        ),
                        text: (text) => TextSpan(text: text),
                      ),
                      textAlign: TextAlign.end,
                    ),
                ],
              ),
            ),
          ],
        ),
        if (calcResult != null && calcResult.breakpoints.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 4,
            children: [
              Row(
                spacing: 8,
                children: [
                  SizedBox(width: 50, child: Text(tr.resinCalcPage.resin)),
                  Expanded(child: Text(tr.resinCalcPage.untilRecovery)),
                  Expanded(child: Text(tr.resinCalcPage.recoveryTime)),
                ],
              ),
              Divider(height: 8),
              for (final bp in calcResult.breakpoints)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  spacing: 8,
                  children: [
                    SizedBox(width: 50, child: Text(bp.resin.toString())),
                    Expanded(child: Text.rich(_formatDuration(bp.timeToFull), style: TextStyle(fontSize: 16))),
                    Expanded(child: Text(_formatDateTime(bp.fullyReplenishedBy))),
                  ],
                ),
            ],
          ),
      ],
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

    const numTextStyle = TextStyle(fontWeight: FontWeight.bold);
    const unitTextStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.normal);

    if (duration.inHours > 0) {
      parts.add(
        tr.common.hours(
          n: duration.inHours,
          nBuilder: (n) => TextSpan(text: n.toString(), style: numTextStyle),
          unit: (unit) => TextSpan(text: unit, style: unitTextStyle),
        ),
      );
    }
    if (duration.inMinutes > 0) {
      parts.add(
        tr.common.minutes(
          n: duration.inMinutes.remainder(60),
          nBuilder: (n) => TextSpan(text: n.toString(), style: numTextStyle),
          unit: (unit) => TextSpan(text: unit, style: unitTextStyle),
        ),
      );
    }
    parts.add(
      tr.common.seconds(
        n: duration.inSeconds.remainder(60),
        nBuilder: (n) => TextSpan(text: n.toString(), style: numTextStyle),
        unit: (unit) => TextSpan(text: unit, style: unitTextStyle),
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
