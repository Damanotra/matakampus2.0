import 'package:flutter/material.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/models/profil.dart';
import 'package:matakampus2/resources/provider/api/profil_api.dart';

class ProfilService {
  final _profilAPI = locator<ProfilAPI>();

  Profil _profile;

  Future<Profil> getLazyProfile(BuildContext context) async {
    if (_profile == null) {
      _profile = await getProfile(context);
    }
    return _profile;
  }

  Future<Profil> getProfile(BuildContext context) async {
    _profile = await _profilAPI.getProfile(context);
    return _profile;
  }

  Future<Profil> updateProfile(Profil profile, BuildContext context) async {
    await _profilAPI.updateProfile(profile, context);
    _profile = _profile.copyWith(profile);
    return _profile;
  }

  Future<void> logout(BuildContext context) {
    //return _profilAPI.logout(context);
  }
}
