
import 'package:flutter/material.dart';

class Ti extends StatefulWidget {
  @override
  _TiState createState() => _TiState();
}







class _TiState extends State<Ti> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 10,
          child: Container(
        height: 300,
            width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
            child: Column(

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(50)
                        ),
                      ),
                      SizedBox(width: 80,),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50)
                        ),

                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50)
                        ),

                      ),

                    ],
                  ),
                ),
                SizedBox(height: 70,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Ars", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                    SizedBox(width: 5,),
                    Text("vs",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red), ),
                    SizedBox(width: 5,),
                    Text("Che", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25))

                  ],
                ),
                SizedBox(height: 130,),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                      child: Text("game  by User ")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
