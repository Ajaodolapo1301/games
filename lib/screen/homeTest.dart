import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oddwise_app/model/tiles.dart';
import 'package:oddwise_app/provider/tiles.dart';
import 'package:oddwise_app/screen/details.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AfterLayoutMixin<Home>{
  TilesProvider tilesState;
  List<Tiles> _tiles = [];


  @override
  void afterFirstLayout(BuildContext context) {
    tilesState.getTilesInfo().then((result){
      print("*******$result");
      if(result['error'] == false) {
        setState(() {
          _tiles = result['tiles'];
          print("lenght ${_tiles.length}");
        });
      }else{
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    tilesState = Provider.of<TilesProvider>(context);


    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white.withOpacity(0.2),
        iconTheme: IconThemeData(color: Color(0xffD8D8D8), ),
      ),
      body: ListView(
        children: <Widget>[
      Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Games", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 40),),

                IconButton(icon: Icon(Icons.add),onPressed: (){},)
              ],
            ),
          SizedBox(height: 10,),
          _tiles.length ==  0   ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ) :     Container(

            height: MediaQuery.of(context).size.height * 0.9,
            child:
            StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(8),
                  crossAxisCount: 2,
                  itemCount: _tiles.length,
                  itemBuilder: (BuildContext context, int index) {
                  return Tile(
                  team: tilesState.tiles[index].fixture.substring(5).replaceAll(":", " VS "),
                  fixture: tilesState.tiles[index].fixture.substring(0,5),
                  );
                  },
                  staggeredTileBuilder: (int index) =>  StaggeredTile.count(1, index.isEven ? 1.5 : 1.7),
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
                  ),
          ),
        ],
      )

    );
  }
}

class Tile extends StatelessWidget {
  final fixture;
  final team;
  Tile({this.fixture, this.team});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(
          team: team,
          fixtures: fixture,
        )));

      },
      child: Card(
        elevation: 10,
        child: Container(
          height:300,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10,),
              Text(fixture, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),),
              SizedBox(height: 100,),
              Align(alignment: Alignment.center,
                  child: Text(team, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),)),


            ],
          ),
        ),
      ),
    );
  }
}



class Cont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      width: 42,
      decoration: BoxDecoration(
        color: Colors.green,
            borderRadius: BorderRadius.circular(10.0)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}


















//StaggeredGridView.countBuilder(
//crossAxisCount: 2,
//
//itemCount: _tiles.length,
//itemBuilder: (BuildContext context, int index) {
//return Tile(
//team: tilesState.tiles[index].fixture.substring(5).replaceAll(":", " VS "),
//fixture: tilesState.tiles[index].fixture.substring(0,5),
//);
//},
//staggeredTileBuilder: (int index) =>
//new StaggeredTile.count(2, index.isEven ? 2 : 1),
//mainAxisSpacing: 4.0,
//crossAxisSpacing: 4.0,
//)