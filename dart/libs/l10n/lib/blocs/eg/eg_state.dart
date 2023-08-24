part of 'eg_bloc.dart';

@immutable
final class EgState {
  final Map<String, dynamic>? iPhone14Pro;
  final double? iPhone14ProInstallments;
  final double? iPhone14ProNow;
  final Map<String, dynamic>? pixel7Pro;
  final double? pixel7ProInstallments;
  final double? pixel7ProNow;
  final double? pixel7ProOriginal;

  const EgState(
      {this.iPhone14Pro,
      this.iPhone14ProInstallments,
      this.iPhone14ProNow,
      this.pixel7Pro,
      this.pixel7ProInstallments,
      this.pixel7ProNow,
      this.pixel7ProOriginal});

  EgState copyWith({
    Map<String, dynamic>? iPhone14Pro,
    double? iPhone14ProInstallments,
    double? iPhone14ProNow,
    Map<String, dynamic>? pixel7Pro,
    double? pixel7ProInstallments,
    double? pixel7ProNow,
    double? pixel7ProOriginal,
  }) =>
      EgState(
        iPhone14Pro: iPhone14Pro ?? this.iPhone14Pro,
        iPhone14ProInstallments: iPhone14ProInstallments,
        iPhone14ProNow: iPhone14ProNow ?? this.iPhone14ProNow,
        pixel7Pro: pixel7Pro ?? this.pixel7Pro,
        pixel7ProInstallments: pixel7ProInstallments,
        pixel7ProNow: pixel7ProNow ?? this.pixel7ProNow,
        pixel7ProOriginal: pixel7ProOriginal,
      );
}
