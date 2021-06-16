import 'package:fclinick_helper/bloc/svd_bloc/svd_state.dart';

class SVDEvent {}
class SVDSaveState extends SVDEvent{
  SVDState svd;

  SVDSaveState(this.svd);
}