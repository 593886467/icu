import 'package:flutter/material.dart';


class Soilpage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Soilpagestate();
  }

}


class Soilpagestate extends State<Soilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('soil'),
      ), 
      body: Center(
        child: Text('soil'),
      )
    ); 
  }
}