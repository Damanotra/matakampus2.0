import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matakampus2/models/Item.dart';
import 'package:matakampus2/resources/provider/api/base_api.dart';

class TemuanAPI extends BaseAPI {

Future<List<Item>> getList(
    int page,
    int perPage,
    String status,
    BuildContext context,
  ) async {
    try {
      final result = await doGet('item/$page/$perPage/$status', context);
      print(result['data']);
      final data = result['data'] as List;
      return data.map((rawOrder) {
        return Item.fromJson(rawOrder);
      }).toList();
    } on Exception catch (err) {
      throw Exception(err.toString());
    }
  }
}