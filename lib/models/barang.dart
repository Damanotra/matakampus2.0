class Barang {
  final String id;
  final String name;
  final String location;
  final String photo;

  Barang({
    this.id,
    this.name,
    this.location,
    this.photo,});

  Barang.fromMap(Map snapshot,String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        location = snapshot['location'] ?? '',
        photo = snapshot['photo'] ?? '';

  toJson(){
    return{
      "name":name,
      "location":location,
      "photo":photo,
    };
  }
}
