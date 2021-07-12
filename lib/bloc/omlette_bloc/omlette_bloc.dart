import 'package:flutter_bloc/flutter_bloc.dart';

import 'omlette_event.dart';
import 'omlette_state.dart';

class OmletteBloc extends Bloc<OmletteEvent, OmletteState> {
  OmletteBloc() : super(OmletteState(null, null, null));

  @override
  Stream<OmletteState> mapEventToState(event) async* {
    if (event is OmletteSaveStateEvent) {
      yield event.omlette;
    }
  }
}
