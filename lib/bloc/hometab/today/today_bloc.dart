import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:matakampus2/bloc/hometab/today/today_event.dart';
import 'package:matakampus2/bloc/hometab/today/today_state.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/models/Item.dart';
import 'package:matakampus2/models/barang.dart';
import 'package:matakampus2/services/barang_service.dart';
import 'package:matakampus2/services/temuan_service.dart';

const perPage = 20;

class TodayBloc extends Bloc<TodayEvent,TodayState> {
  final TemuanService _temuanService = locator<TemuanService>();
  final BarangService _barangService = locator<BarangService>();
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
    if (currentState.isLoading || currentState.hasLoadAllItem) {
      print(currentState.hasLoadAllItem ? 'hasLoadAllItem' : 'isLoading');
      return;
    }

    final nextPage = currentState.items.length ~/ perPage + 1;

    try {
      final orders = await _barangService.getList();
      final hasLoadAllItem = (orders.length < perPage || orders.isEmpty);

      final newOrders = List<Barang>.from(currentState.listbarang);
      newOrders.addAll(orders);
      yield currentState.update(listbarang: newOrders, hasLoadAllItem: hasLoadAllItem);
    } on Exception catch (error) {
      // print(error);
      yield currentState.error('Error Fetching Order Temuan');
    }
  }

  Stream<TodayState> _mapOrderListRefreshToState(TodayRefreshEvent event) async* {
    try {
      yield currentState.loadingScreen();
      final items = await _barangService.getList();
      final hasLoadAllItem = items.length < perPage || items.isEmpty;

      yield currentState.update(listbarang: items, hasLoadAllItem: hasLoadAllItem);
    } on Exception catch (error) {
      yield currentState.error('Error Fetching Temuan');
    }
  }
  
}
