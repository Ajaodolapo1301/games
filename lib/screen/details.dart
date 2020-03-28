import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final fixtures;
  final team;
  Details({this.fixtures, this.team});
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.team)),
    );
  }
}
