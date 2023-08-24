import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';
import 'package:l10n/models/models.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<L10nBloc, L10nState, GenderModel>(
          selector: (state) => state.genderVal,
          builder: (context, state) =>
              Text(AppLocalizations.of(context)!.gender(state.toString())));
}
