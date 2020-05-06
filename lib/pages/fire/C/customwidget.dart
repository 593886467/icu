import 'dart:math';
import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';


class CustomWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CustomWidgetPageState();
  }
}




class CustomWidgetPageState extends State<CustomWidgetPage> with
TickerProviderStateMixin{

  AnimationController _animationController;



  double _turns = .0;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: 3)
    );

    bool isForward = true;
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        isForward = true;
      }else if (status == AnimationStatus.completed
      || status == AnimationStatus.dismissed) {
        if (isForward) {
          _animationController.reverse();
        }else {
          _animationController.forward();

        }
      }else if (status == AnimationStatus.reverse) {
        isForward = false;
      }
    });

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('自定义组件'),
        ),

        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: <Widget>[
                configCurrentColorWidget(Center(
                  child: Text('渐变色按钮'),
                )),
                Gaps.vGap20,
                setupGrdButton(),
                Gaps.vGap20,
                setupTurnBox(),
                Gaps.vGap20,
                configAnimated(context),



              ],
            ),
          ),

        )
    );

  }


  Widget setupGrdButton() {
    return Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            child: Text('渐'),
            colors:[Colors.orange, Colors.red],
            height: 50,
            width: SizeMacro().screenWidth - 40,
            borderRadius: BorderRadius.all(Radius.circular(25)),
            onPressed: onTap,
          ),

        ],
      ),

    );
  }


  Widget setupTurnBox() {
    return Center (
      child: Container(
        child: Column(
          children: <Widget>[

            TurnBox(
              turns: _turns,
              speed: 500,
              child: Icon(Icons.refresh,size: 50,),
            ),

            Gaps.vGap20,

            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(Icons.refresh,size: 150,),
            ),

            Gaps.vGap20,

            GradientButton(

              child:Text('顺时针旋转1/5圈'),
              colors:[Colors.orange, Colors.red],
              height: 50,
              width: SizeMacro().screenWidth - 40,
              borderRadius: BorderRadius.all(Radius.circular(25)),
              onPressed: (){
                setState(() {
                  _turns += .2;
                });
              }
            ),

            Gaps.vGap20,
            GradientButton(

                child:Text('逆时针旋转1/5圈'),
                height: 50,
                width: SizeMacro().screenWidth - 40,
                borderRadius: BorderRadius.all(Radius.circular(25)),
                onPressed: (){
                  setState(() {
                    _turns -= .2;
                  });
                }
            ),



          ],
        ),
      ),
    );
  }

  Widget configAnimated(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
          builder: (BuildContext context, Widget child){


          return Padding(
              padding:const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: <Widget>[
                Wrap(
                  spacing: 10,
                  runSpacing: 16,
                  children: <Widget>[
                    GradientCirularProgressIndicator(

                      radius: 50,

                      colors: [Colors.orange, Colors.red],
                      strokeWidth: 10,
                      value: _animationController.value,
                      totalAngle: pi,
                      strokeCapRound: true,
                    ),

                    GradientCirularProgressIndicator(

                      radius: 20,
                      colors: [Colors.orange, Colors.red],
                      strokeWidth: 2,
                      value: _animationController.value,
                    ),
                  ],
                )
              ],
            ),
          );
          },
    );
  }


  onTap(){
    print('点击');
  }


}

