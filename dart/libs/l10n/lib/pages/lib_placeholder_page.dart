import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/stuff/stuff_bloc.dart';
import 'package:l10n/widgets/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LibPlaceholderPage extends StatelessWidget {
  const LibPlaceholderPage({super.key});
  static FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    const title = Text('placeholder');
    text() => BlocSelector<StuffBloc, StuffState, String>(
        selector: (state) => state.placeholder,
        builder: (context, state) =>
            Text(AppLocalizations.of(context)!.placeholder(state)));
    change(String v) =>
        context.read<StuffBloc>().add(StuffPlaceholderChange(v));

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
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CupertinoTextField(
                    // focusNode: focusNode,
                    // onTap: () => FocusScope.of(context).requestFocus(focusNode),
                    onChanged: change,
                  )),
              text()
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
              Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: TextField(
                    onChanged: change,
                  )),
              text()
            ],
          ))),
      _ => Container()
    };
  }
}
