
import 'package:flutter/cupertino.dart';
import 'package:oddwise_app/api/api.dart';
import 'package:oddwise_app/model/tiles.dart';



class TilesProvider extends AbstractTilesModel {

  List<Tiles> _tiles = [];

  List<Tiles> get tiles => _tiles;


  set tiles(List<Tiles> tiles1) {
    _tiles = tiles1;
    notifyListeners();
  }

  @override
  Future<Map<String, dynamic >> getTilesInfo() async{
    Map<String, dynamic> result = Map();

    try{
      result = await TilesNetwork().getTilesInfo();
      if(result["error"] == null){
        result['error'] = true;
        result['message'] = 'An Error occured, please try again';
      }
    else if(result['error'] == false){
    tiles = result['tiles'];

    }
    }catch(error){
      print(error.toString());
    }
    print("pppppp$result");
    return result;

  }



}


abstract class AbstractTilesModel with ChangeNotifier{
  Future<Map<String,dynamic>> getTilesInfo();

}