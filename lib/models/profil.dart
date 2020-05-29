

class Profil {
  final String id;
  final String name;
  final String email;
  final String password;
  final String photo;


  Profil({
    this.id,
    this.name,
    this.email,
    this.password,
    this.photo,
  });

  factory Profil.fromJson(Map<String, dynamic> json) => Profil(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        photo: json['photo'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      '_id': id,
    };
    json['name']=name;
    json['email']=email;
    json['photo']=photo;
    json['password']=password;
    return json;
  }

  Profil copyWith(Profil other) {
    return Profil(
      name: other.name ?? name,
      email: other.email??email,
      photo:other.photo??photo,
      password: other.password??photo
    );
  }
}
