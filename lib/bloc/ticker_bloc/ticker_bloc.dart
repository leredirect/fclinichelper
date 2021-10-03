import 'package:flutter_bloc/flutter_bloc.dart';

import 'ticker_event.dart';
import 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  TickerBloc() : super(TickerState(null, null));

  @override
  Stream<TickerState> mapEventToState(event) async* {
    if (event is TickerSaveStateEvent) {
      yield event.ticker;
    }
  }
}
