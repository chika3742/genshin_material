import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:timeago/timeago.dart" as timeago;

import "../../components/game_data_sync_indicator.dart";
import "../../components/layout.dart";
import "../../composables/use_periodic_timer.dart";
import "../../core/hoyolab_api.dart";
import "../../i18n/strings.g.dart";
import "../../providers/preferences.dart";
import "../../ui_core/snack_bar.dart";
import "../../utils/resin_calculator.dart";

const maxResin = 200;
const resinRecoveryRateInMinutes = 8;

class ResinCalcPage extends HookConsumerWidget {
  const ResinCalcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStateNotifierProvider);

    final resinController = useTextEditingController(text: prefs.resin?.toString() ?? "");
    final resinInput = useValueListenable(resinController);

    // For rebuilding results every second
    final currentTime = useState(DateTime.now());
    usePeriodicTimer(const Duration(seconds: 1), (_) {
      currentTime.value = DateTime.now();
    });

    final gameDataSyncInProgress = useState(false);
    Future<void> syncResin() async {
      gameDataSyncInProgress.value = true;

      final api = HoyolabApi(cookie: prefs.hyvCookie, region: prefs.hyvServer, uid: prefs.hyvUid);
      try {
        final dailyNote = await api.getDailyNote();
        if (dailyNote.currentResin != maxResin || prefs.resin != maxResin) {
          resinController.text = dailyNote.currentResin.toString();
          ref.read(preferencesStateNotifierProvider.notifier)
              .setResinWithRecoveryTime(dailyNote.currentResin, int.parse(dailyNote.resinRecoveryTime));
        }
      } on HoyolabApiException catch (e) {
        if (context.mounted) showSnackBar(context: context, message: e.getMessage(tr.hoyolab.failedToSyncGameData), error: true);
      } catch (e) {
        if (context.mounted) showSnackBar(context: context, message: tr.hoyolab.failedToSyncGameData, error: true);
      } finally {
        gameDataSyncInProgress.value = false;
      }
    }

    useEffect(() {
      syncResin();
      return null;
    }, [],);

    final rows = _buildRows(prefs);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr.pages.resinCalc),
        ),
        body: Column(
          children: [
            GameDataSyncIndicator(show: gameDataSyncInProgress.value),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: GappedColumn(
                  children: [
                    TextFormField(
                      controller: resinController,
                      keyboardType: TextInputType.number,
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

                    Table(
                      children: [
                        for (final row in rows)
                          TableRow(
                            decoration: row.decoration,
                            children: [
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(row.label),
                                ),
                              ),
                              TableCell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DefaultTextStyle(
                                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: row.content,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    if (prefs.resin == maxResin) Text(
                      "すでに全回復しています",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
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

  List<_ResultItem> _buildRows(PreferencesState prefs) {
    ResinCalculationResult? result;
    if (prefs.resin != null && prefs.resinBaseTime != null) {
      result = calculateResinRecovery(
        currentResin: prefs.resin!,
        baseTime: prefs.resinBaseTime!,
        maxResin: maxResin,
        minutesPerResin: resinRecoveryRateInMinutes,
      );
    }

    final rows = <_ResultItem>[
      _ResultItem(
        tr.resinCalcPage.baseTime,
        () {
          if (prefs.resinBaseTime == null) return const Text("-");
          return Wrap(
            children: [
              Text(_formatDateTime(prefs.resinBaseTime!)),
              const SizedBox(width: 8),
              Text(
                "(${timeago.format(prefs.resinBaseTime!, locale: LocaleSettings.currentLocale.languageCode)})",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ],
          );
        }(),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
      ),
      _ResultItem(
        result != null && result.timeToFull.isNegative
            ? tr.resinCalcPage.recoveredTime
            : tr.resinCalcPage.fullRecoveryTime,
        Text(result != null ? _formatDateTime(result.fullyReplenishedBy) : "-"),
      ),
      _ResultItem(
        tr.resinCalcPage.untilFullRecovery,
        Text(result != null && !result.timeToFull.isNegative
            ? "${tr.common.hours(n: result.timeToFull.inHours)}"
              " ${tr.common.minutes(n: result.timeToFull.inMinutes.remainder(60))}"
            : "-",),
      ),
      _ResultItem(
        tr.resinCalcPage.currentResin,
        Text(result != null ? "${result.currentResin} / $maxResin" : "-"),
      ),
      _ResultItem(
        tr.resinCalcPage.wastedResin,
        Text(result != null && result.wastedResin >= 0 ? result.wastedResin.toString() : "-"),
      ),
    ];

    return rows;
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
}

class _ResultItem {
  final String label;
  final Widget content;
  final Decoration? decoration;

  const _ResultItem(this.label, this.content, {this.decoration});
}
