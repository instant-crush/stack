import 'package:bloc/bloc.dart';
import 'package:l10n/models/gender_model.dart';
import 'package:meta/meta.dart';

part 'stuff_event.dart';
part 'stuff_state.dart';

class StuffBloc extends Bloc<StuffEvent, StuffState> {
  StuffBloc()
      : super(StuffState(
            bottom: false,
            placeholder: '',
            plurals: 0,
            gender: GenderModel.male,
            select: 100,
            number: 0,
            datetime: DateTime.now())) {
    on<StuffBottomChange>(
        (event, emit) => emit(state.copyWith(bottom: !state.bottom)));
    on<StuffPlaceholderChange>(
        (event, emit) => emit(state.copyWith(placeholder: event.val)));
    on<StuffPluralsChange>(
        (event, emit) => emit(state.copyWith(plurals: event.val)));
    on<StuffGenderChange>(
        (event, emit) => emit(state.copyWith(gender: event.val)));
    on<StuffSelectChange>(
        (event, emit) => emit(state.copyWith(select: event.val)));
    on<StuffNumberChange>(
        (event, emit) => emit(state.copyWith(number: event.val)));
    on<StuffDatetimeChange>(
        (event, emit) => emit(state.copyWith(datetime: event.val)));
  }
}
