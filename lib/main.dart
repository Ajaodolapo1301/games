import 'package:flutter/material.dart';
import 'package:oddwise_app/provider/tiles.dart';
import 'package:oddwise_app/screen/splashPage.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>TilesProvider()),
//      ChangeNotifierProvider(create: (_)=>SocketState()),
    ],
    child: MyApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: SplashPage()
    );
  }
}
