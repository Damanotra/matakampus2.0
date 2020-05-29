import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matakampus2/models/Item.dart';
import 'package:matakampus2/resources/provider/api/base_api.dart';

class UserAPI extends BaseAPI {

Future<List<Item>> getList(
    String name,
    String email,
    String photo,
    String password,
    BuildContext context,
  ) async {
    try {
      final result = await doGet('user/detail', context);
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