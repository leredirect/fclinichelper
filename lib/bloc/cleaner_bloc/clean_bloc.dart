import 'package:flutter_bloc/flutter_bloc.dart';

import 'clean_event.dart';
import 'clean_state.dart';

class CleanBloc extends Bloc<CleanEvent, CleanState> {
  CleanBloc() : super(CleanState(null));

  @override
  Stream<CleanState> mapEventToState(event) async* {
    if (event is CleanCleanState) {
      yield event.clean;
    }
  }
}
