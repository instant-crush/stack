part of 'stuff_bloc.dart';

@immutable
sealed class StuffEvent {}

class StuffBottomChange extends StuffEvent {}

class StuffPlaceholderChange extends StuffEvent {
  final String val;
  StuffPlaceholderChange(this.val);
}

class StuffPluralsChange extends StuffEvent {
  final double val;
  StuffPluralsChange(this.val);
}

final class StuffGenderChange extends StuffEvent {
  final GenderModel val;
  StuffGenderChange(this.val);
}

class StuffSelectChange extends StuffEvent {
  final int val;
  StuffSelectChange(this.val);
}

class StuffNumberChange extends StuffEvent {
  final double val;
  StuffNumberChange(this.val);
}

class StuffDatetimeChange extends StuffEvent {
  final DateTime val;
  StuffDatetimeChange(this.val);
}
