import 'package:bloc/bloc.dart';
import 'package:l10n/repos/repos.dart';
import 'package:meta/meta.dart';

part 'eg_event.dart';
part 'eg_state.dart';

class EgBloc extends Bloc<EgEvent, EgState> {
  final ProductsRepo _productsRepo;

  EgBloc({required ProductsRepo productsRepo})
      : _productsRepo = productsRepo,
        super(const EgState()) {
    on<EgIPhone14ProInit>(_egIPhone14ProInitHandler);
    on<EgIPhone14ProChange>(_egIPhone14ProChangeHandler);
    on<EgIPhone14ProUpdate>((event, emit) => emit(state.copyWith(
        iPhone14ProNow: event.iPhone14ProNow,
        iPhone14ProInstallments: event.iPhone14ProInstallments)));
    on<EgPixel7ProInit>(_egPixel7ProInitHandler);
    on<EgPixel7ProChange>(_egPixel7ProChangeHandler);
    on<EgPixel7ProUpdate>((event, emit) => emit(state.copyWith(
        pixel7ProNow: event.pixel7ProNow,
        pixel7ProInstallments: event.pixel7ProInstallments,
        pixel7ProOriginal: event.pixel7ProOriginal)));
  }

  _egIPhone14ProInitHandler(
      EgIPhone14ProInit event, Emitter<EgState> emit) async {
    final data = await _productsRepo.getData();
    final dataProcessed = _dataProcessIPhone14Pro(
        val: data,
        languageCode: event.languageCode!,
        scriptCode: event.scriptCode);
    emit(EgState(
        iPhone14Pro: data,
        iPhone14ProInstallments: dataProcessed.iPhone14ProInstallments,
        iPhone14ProNow: dataProcessed.iPhone14ProNow));
  }

  _egIPhone14ProChangeHandler(
      EgIPhone14ProChange event, Emitter<EgState> emit) {
    final value = _dataProcessIPhone14Pro(
        val: state.iPhone14Pro,
        languageCode: event.languageCode!,
        scriptCode: event.scriptCode);
    emit(state.copyWith(
        iPhone14ProInstallments: value.iPhone14ProInstallments,
        iPhone14ProNow: value.iPhone14ProNow));
  }

  _dataProcessIPhone14Pro(
      {required dynamic val,
      required String languageCode,
      required String? scriptCode}) {
    final data = val['$languageCode${scriptCode ?? ''}'];
    final iPhone14Pro = data != null ? data['storage'][0] : null;
    final iPhone14ProInstallments =
        iPhone14Pro != null && iPhone14Pro['installments'] != null
            ? double.parse(iPhone14Pro['installments'].toString())
            : null;
    final iPhone14ProNow = iPhone14Pro != null
        ? double.parse(iPhone14Pro['now'].toString())
        : null;
    return (
      iPhone14ProInstallments: iPhone14ProInstallments,
      iPhone14ProNow: iPhone14ProNow
    );
  }

  _egPixel7ProInitHandler(EgPixel7ProInit event, Emitter<EgState> emit) async {
    final data = await _productsRepo.getData();
    final dataProcessed = _dataProcessPixel7Pro(
        val: data,
        languageCode: event.languageCode!,
        scriptCode: event.scriptCode);
    emit(EgState(
      pixel7Pro: data,
      pixel7ProInstallments: dataProcessed.pixel7ProInstallments,
      pixel7ProNow: dataProcessed.pixel7ProNow,
      pixel7ProOriginal: dataProcessed.pixel7ProOriginal,
    ));
  }

  _egPixel7ProChangeHandler(EgPixel7ProChange event, Emitter<EgState> emit) {
    final value = _dataProcessPixel7Pro(
        val: state.pixel7Pro,
        languageCode: event.languageCode!,
        scriptCode: event.scriptCode);
    emit(state.copyWith(
        pixel7ProInstallments: value.pixel7ProInstallments,
        pixel7ProNow: value.pixel7ProNow,
        pixel7ProOriginal: value.pixel7ProOriginal));
  }

  _dataProcessPixel7Pro(
      {required dynamic val,
      required String languageCode,
      required String? scriptCode}) {
    final data = val['$languageCode${scriptCode ?? ''}'];
    final pixel7Pro = data != null ? data['storage'][0] : null;
    final pixel7ProInstallments =
        pixel7Pro != null && pixel7Pro['installments'] != null
            ? double.parse(pixel7Pro['installments'].toString())
            : null;
    final pixel7ProNow =
        pixel7Pro != null ? double.parse(pixel7Pro['now'].toString()) : null;
    final pixel7ProOriginal = pixel7Pro != null && pixel7Pro['original'] != null
        ? double.parse(pixel7Pro['original'].toString())
        : null;
    return (
      pixel7ProInstallments: pixel7ProInstallments,
      pixel7ProNow: pixel7ProNow,
      pixel7ProOriginal: pixel7ProOriginal
    );
  }
}
