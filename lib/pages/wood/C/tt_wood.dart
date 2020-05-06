import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';


class Woodpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WoodpageState();
  }
}

class WoodpageState extends State<Woodpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wood'),
      ), 
      body: Center(
        child: TTRefreshWidget()
      )
    ); 
  }
}

