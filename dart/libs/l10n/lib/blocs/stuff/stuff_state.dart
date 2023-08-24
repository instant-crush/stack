part of 'stuff_bloc.dart';

@immutable
final class StuffState {
  final bool bottom;
  final String placeholder;
  final double plurals;
  final GenderModel gender;
  final int select;
  final double number;
  final DateTime datetime;

  const StuffState({
    required this.bottom,
    required this.placeholder,
    required this.plurals,
    required this.gender,
    required this.select,
    required this.number,
    required this.datetime,
  });

  StuffState copyWith({
    bool? bottom,
    String? placeholder,
    double? plurals,
    GenderModel? gender,
    int? select,
    double? number,
    DateTime? datetime,
  }) =>
      StuffState(
        bottom: bottom ?? this.bottom,
        placeholder: placeholder ?? this.placeholder,
        plurals: plurals ?? this.plurals,
        gender: gender ?? this.gender,
        select: select ?? this.select,
        number: number ?? this.number,
        datetime: datetime ?? this.datetime,
      );
}
