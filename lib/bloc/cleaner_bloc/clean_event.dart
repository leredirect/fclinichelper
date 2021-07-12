import 'clean_state.dart';

class CleanEvent {}

class CleanCleanStateEvent extends CleanEvent {
  CleanState clean;

  CleanCleanStateEvent(this.clean);
}
