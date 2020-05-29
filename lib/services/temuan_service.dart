import 'package:flutter/material.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/resources/provider/api/temuan_api.dart';
import 'package:matakampus2/models/Item.dart';

class TemuanService {
  final _temuanAPI = locator<TemuanAPI>();

  Future<List<Item>> getList(
    int page,
    int perPage,
    String status,
    BuildContext context,
  ) async {
    return _temuanAPI.getList(page, perPage, status, context);
  }
}
