import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:l10n/blocs/l10n/l10n_bloc.dart';

class SelectsWidget extends StatelessWidget {
  const SelectsWidget({super.key});

  @override
  Widget build(BuildContext context) => BlocSelector<L10nBloc, L10nState, int>(
      selector: (state) => state.selectsVal,
      builder: (context, state) =>
          Text(AppLocalizations.of(context)!.select(state.toString())));
}
