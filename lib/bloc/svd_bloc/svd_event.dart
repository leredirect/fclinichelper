import 'package:fclinic_helper/bloc/svd_bloc/svd_state.dart';

class SVDEvent {}

class SVDSaveStateEvent extends SVDEvent {
  SVDState svd;

  SVDSaveStateEvent(this.svd);
}
