import 'ticker_state.dart';

class TickerEvent {}

class TickerSaveStateEvent extends TickerEvent {
  TickerState ticker;

  TickerSaveStateEvent(this.ticker);
}
