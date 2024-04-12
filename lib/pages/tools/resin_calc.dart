import "dart:math";

import "package:clock/clock.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:intl/intl.dart";
import "package:timeago/timeago.dart" as timeago;

import "../../components/layout.dart";
import "../../composables/use_periodic_timer.dart";
import "../../i18n/strings.g.dart";
import "../../providers/preferences.dart";

const maxResin = 160;
const resinRechargeRate = 8;

class ResinCalcPage extends StatefulHookConsumerWidget {
  const ResinCalcPage({super.key});

  @override
  ConsumerState<ResinCalcPage> createState() => _ResinCalcPageState();
}

class _ResinCalcPageState extends ConsumerState<ResinCalcPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(preferencesStateNotifierProvider);

    if (state is! AsyncData) {
      return const Center(child: CircularProgressIndicator());
    }

    final resinController = useTextEditingController(text: state.value!.resin.toString());
    final currentResin = useValueListenable(resinController);
    usePeriodicTimer(const Duration(seconds: 1), (_) {
      setState(() {});
    });

    useValueChanged<String, void>(currentResin.text, (_, __) {
      if (currentResin.text.isEmpty) {
        return;
      }

      final resin = int.tryParse(currentResin.text);
      if (resin == null) {
        return;
      }

      ref.read(preferencesStateNotifierProvider.notifier).setResin(resin);
    });

    final rows = _buildRows(state);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(tr.pages.resinCalc),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: GappedColumn(
            children: [
              TextFormField(
                controller: resinController,
                decoration: InputDecoration(
                  labelText: tr.resinCalcPage.currentResin,
                  border: const OutlineInputBorder(),
                  suffixText: "/ 160",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      resinController.clear();
                    },
                  ),
                ),
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if ((int.tryParse(newValue.text) ?? 0) >= maxResin) {
                      return TextEditingValue(text: (maxResin - 1).toString());
                    }
                    return newValue;
                  }),
                  FilteringTextInputFormatter.digitsOnly,
                ],
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
                            child: Text(
                              row.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<_ResultItem> _buildRows(AsyncValue<PreferencesState> state) {
    final fullyReplenishedBy = Clock.fixed(state.value!.resinBaseTime).fromNowBy(
      _calculateTimeToFullResin(state.value!.resin),
    );
    final untilFull = fullyReplenishedBy.difference(const Clock().now());

    final resinDelta = const Clock().now()
        .difference(state.value!.resinBaseTime).inMinutes ~/ resinRechargeRate;

    final wastedResin = state.value!.resin + resinDelta - maxResin;

    final rows = <_ResultItem>[
      _ResultItem(
        tr.resinCalcPage.baseTime,
        "${_formatDateTime(state.value!.resinBaseTime)}"
            " (${timeago.format(state.value!.resinBaseTime)})",
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
      ),
      _ResultItem(
        tr.resinCalcPage.fullyReplenishedBy,
        _formatDateTime(fullyReplenishedBy),
      ),
      _ResultItem(
        tr.resinCalcPage.untilFull,
        untilFull.isNegative
            ? "-"
            : "${tr.resinCalcPage.hours(n: untilFull.inHours)}"
                " ${tr.resinCalcPage.minutes(n: untilFull.inMinutes.remainder(60))}",
      ),
      _ResultItem(
        tr.resinCalcPage.currentResin,
        "${min(state.value!.resin + resinDelta, maxResin)} / $maxResin",
      ),
      _ResultItem(
        tr.resinCalcPage.wastedResin,
        wastedResin >= 0 ? wastedResin.toString() : "-",
      ),
    ];

    return rows;
  }

  Duration _calculateTimeToFullResin(int resin) {
    final diff = maxResin - resin;
    final minutes = diff * resinRechargeRate;
    return Duration(minutes: minutes);
  }

  String _formatDateTime(DateTime dateTime) {
    return "${DateFormat("MMMd", LocaleSettings.currentLocale.languageCode)
        .format(dateTime)} "
        "${DateFormat("jm", LocaleSettings.currentLocale.languageCode)
        .format(dateTime)}";
  }
}

class _ResultItem {
  final String label;
  final String value;
  final Decoration? decoration;

  const _ResultItem(this.label, this.value, {this.decoration});
}
