class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late String image;
  late String url;
  late String created;

  Character(
  {required this.id,
  required this.name,
  required this.status,
  required this.species,
  required this.type,
  required this.gender,
  required this.image,
  required this.url,
  required this.created});

  Character.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  status = json['status'];
  species = json['species'];
  type = json['type'];
  gender = json['gender'];
  image = json['image'];
  url = json['url'];
  created = json['created'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['name'] = this.name;
  data['status'] = this.status;
  data['species'] = this.species;
  data['type'] = this.type;
  data['gender'] = this.gender;
  data['image'] = this.image;
  data['url'] = this.url;
  data['created'] = this.created;
  return data;
  }
  }
