import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';
import 'package:l10n/models/models.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TranslateBottomWidget extends StatelessWidget {
  const TranslateBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<LocalesModel> localesModel = LocalesModel.values;
    leading(LocalesModel localesModel) =>
        Text(localesModel.flag, style: const TextStyle(fontSize: 30));
    title(LocalesModel localesModel) => Text(localesModel.label);
    subtitle(LocalesModel localesModel) => Text(
          AppLocalizations.of(context)!.labels(
              '${localesModel.languageCode}${localesModel.scriptCode ?? ''}'),
        );
    trailing(
            {required LocalesModel localesModel,
            required IconData icon,
            required Color color}) =>
        BlocBuilder<L10nBloc, L10nState>(
          builder: (context, state) => Icon(icon,
              color: localesModel.languageCode == state.locale.languageCode &&
                      localesModel.scriptCode == state.locale.scriptCode
                  ? color
                  : Colors.transparent),
        );
    tap(LocalesModel localesModel) =>
        context.read<L10nBloc>().add(L10nLanguageChange(
            languageCode: localesModel.languageCode,
            scriptCode: localesModel.scriptCode));

    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => CupertinoPopupSurface(
          child: SingleChildScrollView(
              child: CupertinoListSection(
                  hasLeading: false,
                  topMargin: 0,
                  children: localesModel
                      .asMap()
                      .entries
                      .map(
                        (v) => CupertinoListTile.notched(
                          backgroundColor: Colors.transparent,
                          leading: leading(v.value),
                          title: title(v.value),
                          subtitle: subtitle(v.value),
                          trailing: trailing(
                              localesModel: v.value,
                              icon: CupertinoIcons.checkmark_alt,
                              color: CupertinoColors.activeBlue),
                          onTap: () => tap(v.value),
                        ),
                      )
                      .toList()))),
      TargetPlatform.android => ListView.separated(
          itemBuilder: (context, index) => localesModel
              .map((v) => ListTile(
                    leading: leading(v),
                    title: title(v),
                    subtitle: subtitle(v),
                    trailing: trailing(
                        localesModel: v,
                        icon: Icons.check,
                        color: Colors.indigoAccent),
                    onTap: () => tap(v),
                  ))
              .toList()[index],
          separatorBuilder: (_, __) => const Divider(),
          itemCount: localesModel.length),
      _ => Container()
    };
  }
}
