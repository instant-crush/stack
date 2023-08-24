import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibNumPage extends StatelessWidget {
  const LibNumPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('num');
    final value = context.watch<StuffBloc>().state.number;
    double min = -1000000000;
    double max = 1000000000;
    change(double v) => context.read<StuffBloc>().add(StuffNumberChange(v));
    final data = {
      "compact": AppLocalizations.of(context)!.numberCompact(value),
      "compactCurrency":
          AppLocalizations.of(context)!.numberCompactCurrency(value),
      "compactSimpleCurrency":
          AppLocalizations.of(context)!.numberCompactSimpleCurrency(value),
      "compactLong": AppLocalizations.of(context)!.numberCompactLong(value),
      "currency": AppLocalizations.of(context)!.numberCurrency(value),
      "decimalPattern":
          AppLocalizations.of(context)!.numberDecimalPattern(value),
      "decimalPercentPattern":
          AppLocalizations.of(context)!.numberDecimalPercentPattern(value),
      "percentPattern":
          AppLocalizations.of(context)!.numberPercentPattern(value),
      "scientificPattern":
          AppLocalizations.of(context)!.numberScientificPattern(value),
      "simpleCurrency":
          AppLocalizations.of(context)!.numberSimpleCurrency(value)
    }.entries;
    final table = Expanded(
        child: SingleChildScrollView(
            child: DataTable(
                columns: [data.first.key, data.first.value]
                    .map((_) => const DataColumn(label: Text('')))
                    .toList(),
                rows: data
                    .map((v) => DataRow(
                        cells: [v.key, v.value]
                            .map((vv) => DataCell(
                                Text(vv, style: TextStyle(fontSize: 12))))
                            .toList()))
                    .toList())));

    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: title,
            trailing: TranslateWidget(),
          ),
          child: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                CupertinoSlider(
                  min: min,
                  max: max,
                  divisions: (max - min).toInt(),
                  value: value,
                  onChanged: change,
                ),
                table
              ]))),
      TargetPlatform.android => Scaffold(
          appBar: AppBar(
            title: title,
            actions: const [TranslateWidget()],
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Slider(
              min: min,
              max: max,
              divisions: (max - min).toInt(),
              value: value,
              onChanged: change,
            ),
            table
          ])),
      _ => Container()
    };
  }
}
