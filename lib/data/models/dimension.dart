class Dimension{
  late String dimension;
  Dimension.fromJson(Map<String,dynamic> json){
    dimension=json['name'];
  }
}