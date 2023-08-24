import 'dart:io';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:l10n/models/models.dart';
import 'package:meta/meta.dart';

part 'l10n_event.dart';
part 'l10n_state.dart';

class L10nBloc extends HydratedBloc<L10nEvent, L10nState> {
  static final List<String> _locale = Platform.localeName.split('_');
  static LocalesModel _({required String languageCode, String? scriptCode}) =>
      LocalesModel.values.singleWhere(
          (v) => v.languageCode == languageCode && v.scriptCode == scriptCode);

  double numVal;
  DateTime datetimeVal;

  L10nBloc({required this.numVal, required this.datetimeVal})
      : super(L10nState(
            locale: _(
                languageCode: _locale[0],
                scriptCode: _locale.length == 3 ? _locale[1] : null),
            placeholderVal: '',
            pluralsVal: 0,
            selectsVal: 100,
            genderVal: GenderModel.male,
            numVal: numVal,
            datetimeVal: datetimeVal)) {
    on<L10nLanguageChange>((event, emit) => emit(state.copyWith(
        locale: _(
            languageCode: event.languageCode, scriptCode: event.scriptCode))));
    on<L10nPlaceholderChange>(
        (event, emit) => emit(state.copyWith(placeholderVal: event.val)));
    on<L10nPluralsChange>(
        (event, emit) => emit(state.copyWith(pluralsVal: event.val)));
    on<L10nSelectsChange>(
        (event, emit) => emit(state.copyWith(selectsVal: event.val)));
    on<L10nGenderChange>(
        (event, emit) => emit(state.copyWith(genderVal: event.val)));
    on<L10nNumChange>((event, emit) => emit(state.copyWith(numVal: event.val)));
    on<L10nDatetimeChange>(
        (event, emit) => emit(state.copyWith(datetimeVal: event.val)));
  }

  @override
  L10nState? fromJson(Map<String, dynamic> json) => state.copyWith(
      locale: _(
          languageCode: json['languageCode'], scriptCode: json['scriptCode']));

  @override
  Map<String, dynamic>? toJson(L10nState state) => {
        'languageCode': state.locale.languageCode,
        'scriptCode': state.locale.scriptCode
      };
}
