import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';
import 'package:l10n/models/locales_model.dart';
import 'package:l10n/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<L10nBloc, L10nState, LocalesModel>(
          selector: (state) => state.locale,
          builder: (context, state) => MaterialApp.router(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale.fromSubtags(
                    languageCode: state.languageCode,
                    scriptCode: state.scriptCode),
                routerConfig: router,
                theme: ThemeData(useMaterial3: true),
              ));
}
