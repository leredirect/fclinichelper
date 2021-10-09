import 'omlette_state.dart';

class OmletteEvent {}

class OmletteSaveStateEvent extends OmletteEvent {
  OmletteState omlette;

  OmletteSaveStateEvent(this.omlette);
}
