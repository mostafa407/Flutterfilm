import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_film/constant/string.dart';

class CharacterWebService{
   late Dio dio;
  CharacterWebService(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 6),
      receiveTimeout: Duration(seconds: 6),

    );
    dio=Dio(options);
  }
  Future<List<dynamic>>getAllFilm()async{
    try{
      Response response=await dio.get('character');
      print(response.data.toString());
      return response.data['results'];

    }catch(e){
      print(e.toString());
      return [];
    }
  }
  Future<List<dynamic>>getStatus(String charName)async{
    try{
      Response response=await dio.get('episodes',queryParameters: {'name':charName});
      return response.data;
    }catch (e){
      return [];
    }
  }
}