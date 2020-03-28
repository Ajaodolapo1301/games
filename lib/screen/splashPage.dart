import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oddwise_app/screen/homeTest.dart';


class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  bool isLoggedIn = false;




  @override
  void initState() {

    super.initState();
//    CheckIfLoggedIn();
    Timer(Duration(seconds: 5,) , ()=>  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(

    ))));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.black
            ),
          ),

          Center(
            child: Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset("images/vendor.svg")
          ),
          )
        ],
      ),
    );
  }
}


