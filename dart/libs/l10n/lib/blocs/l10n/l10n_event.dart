part of 'l10n_bloc.dart';

@immutable
sealed class L10nEvent {}

final class L10nLanguageChange extends L10nEvent {
  final String languageCode;
  final String? scriptCode;
  L10nLanguageChange({required this.languageCode, this.scriptCode});
}

final class L10nPlaceholderChange extends L10nEvent {
  final String val;
  L10nPlaceholderChange(this.val);
}

final class L10nPluralsChange extends L10nEvent {
  final int val;
  L10nPluralsChange(this.val);
}

final class L10nSelectsChange extends L10nEvent {
  final int val;
  L10nSelectsChange(this.val);
}

final class L10nGenderChange extends L10nEvent {
  final GenderModel val;
  L10nGenderChange(this.val);
}

final class L10nNumChange extends L10nEvent {
  final double val;
  L10nNumChange(this.val);
}

final class L10nDatetimeChange extends L10nEvent {
  final DateTime val;
  L10nDatetimeChange(this.val);
}
