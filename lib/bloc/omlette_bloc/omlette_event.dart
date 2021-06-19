import 'omlette_state.dart';

class OmletteEvent {}
class OmletteSaveState extends OmletteEvent{
  OmletteState omlette;

  OmletteSaveState(this.omlette);
}