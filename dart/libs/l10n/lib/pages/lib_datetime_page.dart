import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibDatetimePage extends StatelessWidget {
  const LibDatetimePage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('num');
    final stuffBlocStateDatetime = context.watch<StuffBloc>().state.datetime;
    final stuffBloc = context.read<StuffBloc>();
    final data = {
      "DAY": AppLocalizations.of(context)!.datetimeDay(stuffBlocStateDatetime),
      "ABBR_WEEKDAY": AppLocalizations.of(context)!
          .datetimeAbbrWeekday(stuffBlocStateDatetime),
      "WEEKDAY":
          AppLocalizations.of(context)!.datetimeWeekday(stuffBlocStateDatetime),
      "ABBR_STANDALONE_MONTH": AppLocalizations.of(context)!
          .datetimeAbbrStandaloneMonth(stuffBlocStateDatetime),
      "STANDALONE_MONTH": AppLocalizations.of(context)!
          .datetimeStandaloneMonth(stuffBlocStateDatetime),
      "NUM_MONTH": AppLocalizations.of(context)!
          .datetimeNumMonth(stuffBlocStateDatetime),
      "NUM_MONTH_DAY": AppLocalizations.of(context)!
          .datetimeNumMonthDay(stuffBlocStateDatetime),
      "NUM_MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeNumMonthWeekdayDay(stuffBlocStateDatetime),
      "ABBR_MONTH": AppLocalizations.of(context)!
          .datetimeAbbrMonth(stuffBlocStateDatetime),
      "ABBR_MONTH_DAY": AppLocalizations.of(context)!
          .datetimeAbbrMonthDay(stuffBlocStateDatetime),
      "ABBR_MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeAbbrMonthWeekdayDay(stuffBlocStateDatetime),
      "MONTH":
          AppLocalizations.of(context)!.datetimeMonth(stuffBlocStateDatetime),
      "MONTH_DAY": AppLocalizations.of(context)!
          .datetimeMonthDay(stuffBlocStateDatetime),
      "MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeMonthWeekdayDay(stuffBlocStateDatetime),
      "ABBR_QUARTER": AppLocalizations.of(context)!
          .datetimeAbbrQuarter(stuffBlocStateDatetime),
      "QUARTER":
          AppLocalizations.of(context)!.datetimeQuarter(stuffBlocStateDatetime),
      "YEAR":
          AppLocalizations.of(context)!.datetimeYear(stuffBlocStateDatetime),
      "YEAR_NUM_MONTH": AppLocalizations.of(context)!
          .datetimeYearNumMonth(stuffBlocStateDatetime),
      "YEAR_NUM_MONTH_DAY": AppLocalizations.of(context)!
          .datetimeYearNumMonthDay(stuffBlocStateDatetime),
      "YEAR_NUM_MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeYearNumMonthWeekdayDay(stuffBlocStateDatetime),
      "YEAR_ABBR_MONTH": AppLocalizations.of(context)!
          .datetimeYearAbbrMonth(stuffBlocStateDatetime),
      "YEAR_ABBR_MONTH_DAY": AppLocalizations.of(context)!
          .datetimeYearAbbrMonthDay(stuffBlocStateDatetime),
      "YEAR_ABBR_MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeYearAbbrMonthWeekdayDay(stuffBlocStateDatetime),
      "YEAR_MONTH":
          AppLocalizations.of(context)!.datetimeMonth(stuffBlocStateDatetime),
      "YEAR_MONTH_DAY": AppLocalizations.of(context)!
          .datetimeMonthDay(stuffBlocStateDatetime),
      "YEAR_MONTH_WEEKDAY_DAY": AppLocalizations.of(context)!
          .datetimeMonthWeekdayDay(stuffBlocStateDatetime),
      "YEAR_ABBR_QUARTER": AppLocalizations.of(context)!
          .datetimeAbbrQuarter(stuffBlocStateDatetime),
      "YEAR_QUARTER": AppLocalizations.of(context)!
          .datetimeYearQuarter(stuffBlocStateDatetime),
      "HOUR24":
          AppLocalizations.of(context)!.datetimeHour24(stuffBlocStateDatetime),
      "HOUR24_MINUTE": AppLocalizations.of(context)!
          .datetimeHour24Minute(stuffBlocStateDatetime),
      "HOUR24_MINUTE_SECOND": AppLocalizations.of(context)!
          .datetimeHour24MinuteSecond(stuffBlocStateDatetime),
      "HOUR":
          AppLocalizations.of(context)!.datetimeHour(stuffBlocStateDatetime),
      "HOUR_MINUTE": AppLocalizations.of(context)!
          .datetimeHourMinute(stuffBlocStateDatetime),
      "HOUR_MINUTE_SECOND": AppLocalizations.of(context)!
          .datetimeHourMinuteSecond(stuffBlocStateDatetime),
      "MINUTE":
          AppLocalizations.of(context)!.datetimeMinute(stuffBlocStateDatetime),
      "MINUTE_SECOND": AppLocalizations.of(context)!
          .datetimeMinuteSecond(stuffBlocStateDatetime),
      "SECOND":
          AppLocalizations.of(context)!.datetimeSecond(stuffBlocStateDatetime),
    }.entries;
    final datetimeDateButtonText =
        Text(AppLocalizations.of(context)!.datetimeDateButtonText);
    final datetimeTimeButtonText =
        Text(AppLocalizations.of(context)!.datetimeTimeButtonText);
    const cupertinoPickerHeight = 300.0;
    final dateMin = DateTime(0);
    final dateMax = DateTime(3000);
    dateChange(DateTime value) => stuffBloc.add(StuffDatetimeChange(DateTime(
        value.year,
        value.month,
        value.day,
        stuffBlocStateDatetime.hour,
        stuffBlocStateDatetime.minute,
        stuffBlocStateDatetime.second,
        stuffBlocStateDatetime.millisecond,
        stuffBlocStateDatetime.microsecond)));
    timeChange(dynamic value) {
      final datetime = DateTime.now();
      if (value is DateTime || value is TimeOfDay) {
        stuffBloc.add(StuffDatetimeChange(DateTime(
            stuffBlocStateDatetime.year,
            stuffBlocStateDatetime.month,
            stuffBlocStateDatetime.day,
            value.hour,
            value.minute,
            datetime.second,
            datetime.millisecond,
            datetime.microsecond)));
      }
    }

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
                                Text(vv, style: const TextStyle(fontSize: 12))))
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
                CupertinoButton(
                    child: datetimeDateButtonText,
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                            color: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            height: cupertinoPickerHeight,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              minimumDate: dateMin,
                              maximumDate: dateMax,
                              onDateTimeChanged: dateChange,
                            )))),
                CupertinoButton(
                    child: datetimeTimeButtonText,
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                            color: CupertinoColors.systemBackground
                                .resolveFrom(context),
                            height: cupertinoPickerHeight,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: timeChange,
                            )))),
                table
              ]))),
      TargetPlatform.android => Scaffold(
          appBar: AppBar(
            title: title,
            actions: const [TranslateWidget()],
          ),
          body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              child: datetimeDateButtonText,
              onPressed: () async {
                final value = await showDatePicker(
                  context: context,
                  initialDate: stuffBlocStateDatetime,
                  firstDate: dateMin,
                  lastDate: dateMax,
                );
                dateChange(value!);
              },
            ),
            TextButton(
              child: datetimeTimeButtonText,
              onPressed: () async {
                final value = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(stuffBlocStateDatetime),
                );
                timeChange(value!);
              },
            ),
            table
          ])),
      _ => Container()
    };
  }
}
