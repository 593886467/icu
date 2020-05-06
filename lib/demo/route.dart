import 'package:flutter/material.dart';

void main() => runApp(NewRoute());

class NewRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new route')
      ),

      body: Center(
        child: Text('路由')
      ),
    ); 
  }
}