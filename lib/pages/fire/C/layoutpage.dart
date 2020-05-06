import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';

class CurrentLayoutWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('布局类组件'),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              setupLayoutRow(),
              Gaps.vGap20,
              setupFlex(),
              Gaps.vGap20,
              configCurrentColorWidget(Center(
                child: Text('Wrap'),
              )),
              Gaps.vGap20,
              setupWrap(),
              Gaps.vGap20,
              setupAlign()


            ],
          ),
        ),

      )
    );

  }


  Widget setupLayoutRow() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('data'),
                  Text('data1')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget setupFlex() {

    return Container(

      child: Column(
        children: <Widget>[
          configCurrentColorWidget(Center(
            child: Text('Flex'),
          )),
          Gaps.vGap20,

          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                  child: Container(
                    height: 30,
                    color:  Colors.red,
                  )
              ),

              Expanded(
                flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  )
              )


            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 100,
              child: Flex(
                  direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    ),
                  ),

                  Spacer(
                    flex: 1,
                  ),

                  Expanded(
                    flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.green,

                      )
                  )

                ],

              ),
            ),

          )
        ],
      ),


    );
  }


  Widget setupWrap() {
    return Container(
      color: Colors.grey,
      child:     Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            label: Text('data'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),

          Chip(
            label: Text('data'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),

          Chip(
            label: Text('data'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),

          Chip(
            label: Text('data'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),

          Chip(
            label: Text('data'),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text('A'),
            ),
          ),

        ],

      ),
    );

  }

  Widget setupAlign() {
    return Container(
      color: ColorsMacro.col_FAF,
      child: Column(

        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            color: Colors.blue,
            child: Align(
              alignment: Alignment.topRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),

          Gaps.vGap20,
        ],

      ),
    );


  }







}

