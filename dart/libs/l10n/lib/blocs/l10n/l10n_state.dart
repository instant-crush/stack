part of 'l10n_bloc.dart';

@immutable
final class L10nState {
  final LocalesModel locale;
  final String placeholderVal;
  final int pluralsVal;
  final int selectsVal;
  final GenderModel genderVal;
  final double numVal;
  final DateTime datetimeVal;

  const L10nState({
    required this.locale,
    required this.placeholderVal,
    required this.pluralsVal,
    required this.selectsVal,
    required this.genderVal,
    required this.numVal,
    required this.datetimeVal,
  });

  L10nState copyWith({
    LocalesModel? locale,
    String? placeholderVal,
    int? pluralsVal,
    int? selectsVal,
    GenderModel? genderVal,
    double? numVal,
    DateTime? datetimeVal,
  }) =>
      L10nState(
        locale: locale ?? this.locale,
        placeholderVal: placeholderVal ?? this.placeholderVal,
        pluralsVal: pluralsVal ?? this.pluralsVal,
        selectsVal: selectsVal ?? this.selectsVal,
        genderVal: genderVal ?? this.genderVal,
        numVal: numVal ?? this.numVal,
        datetimeVal: datetimeVal ?? this.datetimeVal,
      );
}
