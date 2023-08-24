import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibSelectPage extends StatelessWidget {
  const LibSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('select');
    const httpStatus = [100, 200, 300, 400, 500];
    final buttonText = Text(AppLocalizations.of(context)!.genderButtonText);
    final text = BlocSelector<StuffBloc, StuffState, int>(
      selector: (state) => state.select,
      builder: (context, state) =>
          Text(AppLocalizations.of(context)!.select(state.toString())),
    );
    select(int v) => context.read<StuffBloc>().add(StuffSelectChange(v));
    item(int v) => Text(v.toString());

    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: title,
            trailing: TranslateWidget(),
          ),
          child: SafeArea(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                CupertinoButton(
                    child: buttonText,
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                              color: CupertinoColors.systemBackground
                                  .resolveFrom(context),
                              height: 150,
                              child: CupertinoPicker(
                                  itemExtent: 30,
                                  onSelectedItemChanged: (int value) =>
                                      select(httpStatus[value]),
                                  scrollController: FixedExtentScrollController(
                                      initialItem: httpStatus.indexWhere((v) =>
                                          v ==
                                          context
                                              .watch<StuffBloc>()
                                              .state
                                              .gender)),
                                  children:
                                      httpStatus.map((v) => item(v)).toList()),
                            ))),
                text,
              ])))),
      TargetPlatform.android => Scaffold(
          appBar: AppBar(
            title: title,
            actions: const [TranslateWidget()],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton(
                  initialValue: httpStatus[0],
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: buttonText,
                  ),
                  itemBuilder: (BuildContext context) => httpStatus
                      .map((v) => PopupMenuItem<int>(value: v, child: item(v)))
                      .toList(),
                  onSelected: (value) => select(value)),
              text
            ],
          ))),
      _ => Container()
    };
  }
}
