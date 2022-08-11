import 'dart:convert';

import '../../models/model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(uri);
    if(response.statusCode == 200){
      print("--------------statuscode 200---------");
      print(jsonDecode(response.body));
      print("-------------------------------------");
      var json = response.body;
      return postFromJson(json);
    }else{
      print("--------------statuscode ${response.statusCode}---------");
    }
  }
  /*Future<Post> getCreators() async{
    var uri = Uri.parse("https://gateway.marvel.com:443/v1/public/creators/1?ts=10&apikey=95938160f410b2d22c47df329a278dcb&hash=9e95bd239d069cdd5bed4dddcc46f9e0");
    final response = await http.get(uri);
    if(response.statusCode==200){
      var json = response.body;
      return postFromJson(json);
    }else{
      throw Exception("------------------${response.statusCode}----------------");
    }
  }*/
}
