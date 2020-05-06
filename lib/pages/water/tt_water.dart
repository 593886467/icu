import 'package:flutter/material.dart';


class Waterpage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return WaterpagesState();
  }

  
}

class WaterpagesState extends State<Waterpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('water'),
      ), 
      body: Center(
        child: Text('water'),
      )
    ); 
  }
}