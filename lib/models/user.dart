class User {
  final String id;
  final String name;
  final String email;
  final String photo;
  final String password;
  
  User({this.id, this.name, this.email, this.photo, this.password});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        name: json['name'],
        email: json['email'],
        photo: json['photo'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'photo' : photo,
      'password':password
    };
  }
}