import 'package:equatable/equatable.dart';

class AuthToken extends Equatable {
  final String token;

  AuthToken({
    this.token
  });

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    return AuthToken(
      token: json['token']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
