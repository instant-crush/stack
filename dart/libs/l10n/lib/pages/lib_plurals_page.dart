import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibPluralsPage extends StatelessWidget {
  const LibPluralsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const title = Text('plurals');
    double value = context.watch<StuffBloc>().state.plurals;
    double min = -10;
    double max = 10;
    change(double v) => context.read<StuffBloc>().add(StuffPluralsChange(v));
    final text = Text(AppLocalizations.of(context)!.plurals(value.toInt()));

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
              CupertinoSlider(
                  min: min, max: max, value: value, onChanged: change),
              text
            ],
          )))),
      TargetPlatform.android => Scaffold(
          appBar: AppBar(
            title: title,
            actions: const [TranslateWidget()],
          ),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(min: min, max: max, value: value, onChanged: change),
              text
            ],
          ))),
      _ => Container()
    };
  }
}
