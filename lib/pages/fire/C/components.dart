import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:icu/current_index.dart';


















class BasicComponentsWidget extends StatefulWidget {

  final int initValue;



  const BasicComponentsWidget({
    Key key,
    this.initValue : 0
  });

  @override
  _BasicComponentsWidgetState createState() => _BasicComponentsWidgetState();
}

class _BasicComponentsWidgetState extends State<BasicComponentsWidget> {

  int _counter;

  bool flag = false;

  bool _switchSelected = true;

  bool _checkoutboxSelected = true;

  TextEditingController _unameController = TextEditingController();

  TapGestureRecognizer tap = TapGestureRecognizer();



  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      backgroundColor: Color(0xff232540),
      appBar: AppBar(
        backgroundColor: Color(0xff232440),
        elevation: 0,
        title: Text('基础组件'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            configState(),
            SizedBox(height: 20),
            configText(),
            SizedBox(height: 20),
            configTextSpan(),
            SizedBox(height: 20),
            configSwitch(),
            SizedBox(height: 20),
            configBtn(),
            SizedBox(height: 20),
            configTextField(),
            Gaps.vGap20,
            ProgressRoute(),
          ],
        ) ,

      )

    );
  }


  // ------------- 自定义组件 --------------- //

  /*
  * widget状态
  * */
  Widget configState() {
    Widget btn =  FlatButton(
            color: Colors.red,
            highlightColor: Colors.amber,
            colorBrightness: Brightness.dark,
            onPressed: ()=> setState(() => ++_counter),
            shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
            child: Text('$_counter'),
          );
    List<Color>  colors = [Colors.orange,Colors.amber,Colors.white];
    return configCurrentWidget(configRowWidget('Widget 状态', btn), colors);
  }

  /*
  * TextStyle
  * */
  Widget configText(){
    final current = Text(
      'hello world',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 18.0,
        height: 1.2,
        fontFamily: 'Courier',
        background: Paint()..color=Colors.yellow,
        decoration: TextDecoration.underline,
        decorationStyle: TextDecorationStyle.dashed
      ),
    );
    return configNormal('TextStyle', current);
  }


  /*
  * TextSpan
  * */
  Widget configTextSpan(){
    final current  = DefaultTextStyle(
        style: TextStyle(color: Colors.red,fontSize: 10),
        child:Text.rich(TextSpan(
            children: [
              TextSpan(
                  text: 'Home:'
              ),
              TextSpan(
                  text: "www.baidu.com",
                  style: TextStyle (
                    color: flag ? Colors.red : Colors.blue,
                    fontSize: flag ? 18 : 12,
                  ),
                  recognizer: tap..onTap =() {
                    setState(() {
                      flag = !flag;
                    });
                  }
              )
            ]
        ))
    );
    return configNormal('TextSpan+Defaultyle', current);
  }

  Widget configSwitch () {
    
    final current = Row(
      children: <Widget>[
        Switch(
        value: _switchSelected,
        onChanged: (value){
          setState(() {
            _switchSelected = value;
          });
        }),

        Checkbox(
            value: _checkoutboxSelected,
            activeColor: Colors.red ,
            onChanged: (value){
              setState(() {
                _checkoutboxSelected = value;
              });
            }),

      ],
    );
    return configNormal('Switch Checkbox', current);
  }
  
  Widget configBtn() {
    final current = Column(
      children: <Widget>[
        RaisedButton(onPressed: (){},child: Text('Raised')),
        FlatButton(onPressed: (){}, child: Text('Flat')),
        OutlineButton(onPressed: (){},child: Text('Out')),
        IconButton(icon: Icon(Icons.thumb_down), onPressed: (){}),
        RaisedButton(
          onPressed: (){},
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text(
            'Submit'
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        )
      ],
    );
    List<Color> colors = [Colors.white,Colors.white70];
    return configCurrentNoraWidget(current, colors, null,SizeMacro().screenWidth - 40, 5);

  }

  Widget configTextField() {

    final current = Container(
      width: SizeMacro().screenWidth - 100,
      child: TextField(
        controller: _unameController,
        keyboardType: TextInputType.number,
        onChanged: (v) {
          print("onchange: $v");
        },

        decoration: InputDecoration(
          labelText: '密码',
          hintText: '请输入密码',
          prefixIcon: Icon(Icons.content_paste),
          border: InputBorder.none
        ),
      ),

      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))
      )
    );

    List<Color> colors = [Colors.white,Colors.white70];
    return configCurrentNoraWidget(current, colors, null,SizeMacro().screenWidth - 40, 5);
  }


  
  




  /*
  * 通用控件
  * */
  configNormal(String name, Widget current) {
    List<Color> colors = [Colors.white,Colors.white70];
    return configCurrentWidget(configRowWidget(name, current), colors);
  }









  

  
































































































  // ----------- 生命周期 ----------- //
  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    _unameController.addListener(() {
      print(_unameController.text);
    });
    print('initState');
  }


  @override
  void didUpdateWidget(BasicComponentsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactive');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('ressemble');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}


class ProgressRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressRouteState();
  }
}

class ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  
  @override
  void initState() {

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 10));
    _animationController.forward();
    _animationController.repeat();
    _animationController.addListener(() {
      setState(() {


      });

      if(_animationController.value == 1) {
        _animationController.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(
              begin: Colors.grey,
              end: Colors.red
            ).animate(_animationController),
            value: _animationController.value,
          ),
          )
        ],
      ),
    );
  }
}