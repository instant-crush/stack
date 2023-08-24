import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/models/gender_model.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibGenderPage extends StatelessWidget {
  const LibGenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('gender');
    const genderModel = GenderModel.values;
    final buttonText = Text(AppLocalizations.of(context)!.genderButtonText);
    final text = BlocSelector<StuffBloc, StuffState, String>(
      selector: (state) => state.gender.name,
      builder: (context, state) =>
          Text(AppLocalizations.of(context)!.gender(state)),
    );
    select(GenderModel genderModel) =>
        context.read<StuffBloc>().add(StuffGenderChange(genderModel));
    item(GenderModel genderModel) =>
        Text(AppLocalizations.of(context)!.genders(genderModel.name));

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
                                      select(genderModel[value]),
                                  scrollController: FixedExtentScrollController(
                                      initialItem: genderModel.indexWhere((v) =>
                                          v ==
                                          context
                                              .watch<StuffBloc>()
                                              .state
                                              .gender)),
                                  children:
                                      genderModel.map((v) => item(v)).toList()),
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
                  initialValue: genderModel[0],
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: buttonText,
                  ),
                  itemBuilder: (BuildContext context) => genderModel
                      .map((v) =>
                          PopupMenuItem<GenderModel>(value: v, child: item(v)))
                      .toList(),
                  onSelected: (value) => select(value)),
              text
            ],
          ))),
      _ => Container()
    };
  }
}
