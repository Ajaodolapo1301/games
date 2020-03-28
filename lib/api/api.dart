import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oddwise_app/model/tiles.dart';



abstract class AbstractTiles{
  Future<Map<String,dynamic>> getTilesInfo();
//  Future<Map<String,dynamic>> getAuthUser({String token});
//  Future<Map<String,dynamic>> registerUser({ fname,  lname,  password, address,   email,  phone});

}

class TilesNetwork implements AbstractTiles  {
  @override
  Future<Map<String,dynamic >> getTilesInfo() async {
    Map<String, dynamic> result = {};
        final   String url =  "https://oddwyse.herokuapp.com/api/v1/todaysgame/all";


        try{
           var response = await  http.get(url);
         int statusCode = response.statusCode;
            if(statusCode != 200){
            result["message"] = "An error occured";
            result["error"]= true;
          }else{
              result["error"] = false;
                List<Tiles> tiles = [];
                (jsonDecode(response.body)["today"] as List).forEach((ti){
                  tiles.add(Tiles.fromJson(ti));
              });

                result['tiles'] = tiles;
              }



        }catch(error){
          print(error.toString());
        }

    return result;
  }

}