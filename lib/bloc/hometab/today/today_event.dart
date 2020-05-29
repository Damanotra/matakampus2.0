import 'package:flutter/material.dart';

class TodayEvent {
  final BuildContext context;
  TodayEvent(this.context);
}

class TodayFetchEvent extends TodayEvent {
  TodayFetchEvent(BuildContext context) : super(context);

  @override
  String toString() {
    return "TodayFetchEvent";
  }
}

class TodayRefreshEvent extends TodayEvent {
  TodayRefreshEvent(BuildContext context) : super(context);

  @override
  String toString() {
    return "TodayRefreshEvent";
  }
}
