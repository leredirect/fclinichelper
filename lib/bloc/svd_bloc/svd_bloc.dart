import 'package:fclinick_helper/bloc/svd_bloc/svd_event.dart';
import 'package:fclinick_helper/bloc/svd_bloc/svd_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:decimal/decimal.dart';

class SVDBloc extends Bloc<SVDEvent, SVDState> {
  SVDBloc() : super(SVDState(Decimal.zero, Decimal.zero));

  @override
  Stream<SVDState> mapEventToState(event) async*{
if(event is SVDSaveState){
  yield event.svd;
}
  }
}