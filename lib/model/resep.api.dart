import 'dart:convert';
// import 'package:resep makanan/model/resep.api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_resep_app/model/resep.dart';

class ResepApi{

  // var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

  // req.query({
  //   "limit": "18",
  //   "start": "0",
  //   "tag": "list.recipe.popular"
  // });

  // req.headers({
  //   "x-rapidapi-host": "yummly2.p.rapidapi.com",
  //   "x-rapidapi-key": "221ba7cdd6msha74c6b5aaf85dcap11da96jsn90d5aeef6ec2",
  //   "useQueryString": true
  // });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list', {
      "from": "0",
      "size": "20",
      "tags": "under_30_minutes"
    });
    
    final reseponse = await http.get(uri, headers:{
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "x-rapidapi-key": "221ba7cdd6msha74c6b5aaf85dcap11da96jsn90d5aeef6ec2",
      "useQueryString": "true"
    });

    Map data = jsonDecode(reseponse.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Resep.resepFromSnapshot(_temp); 
  }
}