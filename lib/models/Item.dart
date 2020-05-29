class Item {
  final String id;
  final String name;
  final String location;
  final String date;
  final String time;
  final String description;
  final String photo;
  final String finder;

  Item({
    this.id, 
    this.name, 
    this.location, 
    this.date, 
    this.time, 
    this.description,
    this.photo, 
    this.finder});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['_id'],
        name: json['name'],
        location: json['location'],
        date: json['date'],
        time: json['time'],
        description: json['description'],
        photo: json['photo'],
        finder: json['finder'],
      );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'date': date,
      'time': time,
      'description': description,
      'photo' : photo,
      'finder': finder
    };
  }

  Item copyWith(Item other) {
    return Item(
      id: other.id ?? id,
      name: other.name ?? name,
      location: other.location ?? location,
      date: other.date ?? date,
      time: other.time ?? time,
      description: other.description ?? description,
      photo: other.photo ?? photo,
      finder: other.finder ?? finder,
    );
  }
}