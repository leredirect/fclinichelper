import 'clean_state.dart';

class CleanEvent {}

class CleanCleanState extends CleanEvent {
  CleanState clean;

  CleanCleanState(this.clean);
}
