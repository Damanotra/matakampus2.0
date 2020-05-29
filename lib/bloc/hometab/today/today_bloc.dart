import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:matakampus2/bloc/hometab/today/today_event.dart';
import 'package:matakampus2/bloc/hometab/today/today_state.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/models/Item.dart';
import 'package:matakampus2/services/temuan_service.dart';

const perPage = 20;

class TodayBloc extends Bloc<TodayEvent,TodayState> {
  final TemuanService _temuanService = locator<TemuanService>();
  String status;

  @override
  // TODO: implement initialState
  TodayState get initialState => TodayState.initial();

  @override
  Stream<TodayState> mapEventToState(TodayEvent event) async* {
    // TODO: implement mapEventToState
    if(event is TodayFetchEvent){
      yield* _mapTodayToState(event);
    } else if (event is TodayRefreshEvent) {
      yield* _mapOrderListRefreshToState(event);
    }
  }

  Stream<TodayState> _mapTodayToState(TodayFetchEvent event) async* {
    if(currentState)
  }

  Stream<TodayState> _mapOrderListRefreshToState(TodayRefreshEvent event) async* {


  }
  
}
