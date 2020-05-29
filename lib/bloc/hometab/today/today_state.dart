import 'package:equatable/equatable.dart';
import 'package:matakampus2/models/barang.dart';
import 'package:meta/meta.dart';
import 'package:matakampus2/models/Item.dart';

class TodayState extends Equatable {
  final List<Item> items;
  final List<Barang> listbarang;
  final bool hasLoadAllItem;
  final bool isLoading;
  final String errorMessage;

  TodayState({
    @required this.items,
    @required this.listbarang,
    @required this.hasLoadAllItem,
    this.isLoading = false,
    this.errorMessage,
  });

  TodayState copyWith({
    List<Barang> listbarang,
    bool hasLoadAllItem,
    bool isLoading,
    String errorMessage,
  }) {
    return TodayState(
      items: items ?? this.items,
      hasLoadAllItem: hasLoadAllItem ?? this.hasLoadAllItem,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory TodayState.initial() {
    return TodayState(
      items: [],
      hasLoadAllItem: false,
    );
  }

  TodayState loadingScreen() {
    return copyWith(
      isLoading: true,
    );
  }

  TodayState error(String error) {
    return copyWith(
      isLoading: false,
      errorMessage: error,
    );
  }

  TodayState update({
    List<Barang> listbarang,
    bool hasLoadAllItem,
  }) {
    return copyWith(
      listbarang: listbarang ?? this.items,
      hasLoadAllItem: hasLoadAllItem ?? this.hasLoadAllItem,
      isLoading: false,
      errorMessage: '',
    );
  }

  @override
  String toString() => '''
  OrderListState {
    items: ${items.length},
    hasLoadAllItem: $hasLoadAllItem,
    isLoading: $isLoading,
    errorMessage: $errorMessage,
  }
  ''';
}
