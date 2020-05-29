import 'dart:async';

import 'package:flutter/material.dart';
import 'package:matakampus2/models/Item.dart';
import 'package:matakampus2/models/profil.dart';
import 'package:matakampus2/resources/provider/api/base_api.dart';

class ProfilAPI extends BaseAPI {

  Future<Profil> getProfile(BuildContext context) async {
    try {
      final result = await doGet('user/detail', context);
      print(result['data']);
      final data = result['data'];
      return Profil.fromJson(data);
    } on Exception catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<Profil> updateProfile(Profil profile, BuildContext context) async {
    await doPut('profile', profile.toJson(), context);
    return profile;
  }
}