part of 'eg_bloc.dart';

@immutable
sealed class EgEvent {
  final String? languageCode;
  final String? scriptCode;

  const EgEvent({this.languageCode, this.scriptCode});
}

final class EgIPhone14ProInit extends EgEvent {
  const EgIPhone14ProInit({required super.languageCode, super.scriptCode});
}

final class EgIPhone14ProChange extends EgEvent {
  const EgIPhone14ProChange({required super.languageCode, super.scriptCode});
}

final class EgIPhone14ProUpdate extends EgEvent {
  final double iPhone14ProNow;
  final double? iPhone14ProInstallments;

  const EgIPhone14ProUpdate(
      {required this.iPhone14ProNow, this.iPhone14ProInstallments});
}

final class EgPixel7ProInit extends EgEvent {
  const EgPixel7ProInit({required super.languageCode, super.scriptCode});
}

final class EgPixel7ProChange extends EgEvent {
  const EgPixel7ProChange({required super.languageCode, super.scriptCode});
}

final class EgPixel7ProUpdate extends EgEvent {
  final double pixel7ProNow;
  final double? pixel7ProInstallments;
  final double? pixel7ProOriginal;

  const EgPixel7ProUpdate(
      {required this.pixel7ProNow,
      this.pixel7ProInstallments,
      this.pixel7ProOriginal});
}
