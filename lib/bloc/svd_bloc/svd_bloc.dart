import 'package:fclinic_helper/bloc/svd_bloc/svd_event.dart';
import 'package:fclinic_helper/bloc/svd_bloc/svd_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SVDBloc extends Bloc<SVDEvent, SVDState> {
  SVDBloc() : super(SVDState(null, null));

  @override
  Stream<SVDState> mapEventToState(event) async*{
if(event is SVDSaveState) {
  yield event.svd;
}
  }
}