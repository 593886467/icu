import 'dart:math';
import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';


class NothingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('空'),
      ),
      body: Center(
        child: Text('空'),
      ),
    );
  }
}


class GradientButton extends StatelessWidget {

  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.borderRadius,
    this.onPressed,
    @required this.child
  });

  /// 渐变色数组
  final List<Color> colors;

  final double width;

  final double height;

  final Widget child;

  final BorderRadius borderRadius;

  final GestureTapCallback onPressed;


  @override
  Widget build(BuildContext context) {

    ThemeData theme = Theme.of(context);

    List<Color> _colors = colors ?? [theme.primaryColor,theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(

      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),

      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
              constraints: BoxConstraints.tightFor(height: height,width: width),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child
                ),

              ),

            ),
          ),

        ),
      ),

    );
  }
}

class TurnBox extends StatefulWidget {


  const TurnBox({
   Key key,
   this.turns = .0,
    this.speed = 200,
    this.child,
  }): super(key: key);


  final double turns;

  final int speed;

  final Widget child;


  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}


class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,

      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;

  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(microseconds: widget.speed??200),
        curve: Curves.easeInOut,
      );
    }
  }
}

class GradientCirularProgressIndicator extends StatelessWidget {

  /// 粗细
  final double strokeWidth;
  /// 圆的半径
  final double radius;
  /// 两端是否为圆角
  final bool strokeCapRound;
  /// 进度条背景色
  final Color backgroundColor;
  /// 当前进度 [0.0 - 1.0]
  final double value;
  /// 进度条的总弧度 2 * PI 为 圆
  final double totalAngle;
  /// 渐变色数组
  final List<Color> colors;
  /// 渐变色终止点 ， 对应colors 属性
  final List<double> stops;

  GradientCirularProgressIndicator({
    this.strokeWidth = 2.0,
    @required this.radius,
    @required this.colors,
    this.stops,
    this.strokeCapRound = false,
    this.backgroundColor = ColorsMacro.col_EEE,
    this.totalAngle = 2 * pi,
    this.value
  });

  @override
  Widget build(BuildContext context) {
    double _offset = .0;

    if(strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context)
          .accentColor;
      _colors = [color,color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCirularProgressPainter(
          strokeWidth: strokeWidth,
          strokeCapRound: strokeCapRound,
          backgroundColor: backgroundColor,
          value: value,
          total: totalAngle,
          radius: radius,
          colors: _colors,
        ),

      ),
    );
  }

}

/// 实现画笔

class _GradientCirularProgressPainter extends CustomPainter {

  _GradientCirularProgressPainter({
    this.strokeWidth = 10.0,
    this.strokeCapRound = false,
    this.backgroundColor = ColorsMacro.col_EEE,
    this.radius,
    this.total = 2 *pi,
    @required this.colors,
    this.stops,
    this.value
  });


  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;


  @override
  void paint(Canvas canvas, Size size) {

    if(radius != null) {
      size = Size.fromRadius(radius);
    }

    double _offset = strokeWidth / 2;
    double _value = (value ?? .0);
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) & Size(
        size.width - strokeWidth,
        size.height - strokeWidth
    );

    var paint = Paint()
    ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = strokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;

      canvas.drawArc(rect, _start, total, false, paint);

    }

    if (_value > 0) {
      paint.shader = SweepGradient(
        colors: colors,
        endAngle: _value,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new SizedBox(
        width: 24.0,
        height: 24.0,
        child: new CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
































































Widget configCurrentWidget(Widget child , List<Color> colors) {
  return configCurrentNoraWidget(child, colors, 50,null, 25);
}

Widget configCurrentColorWidget(Widget child) {
  return configCurrentNoraWidget(child, [Colors.red, Colors.orange], 50, SizeMacro().screenWidth - 40, 25);
}


Widget configCurrentNoraWidget(Widget child, List<Color> colors, double height, double width, double borderradius) {
  return Container(
    height: height,
    width: width,
    margin: EdgeInsets.only(left: 20,right: 20),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: colors),
      borderRadius: BorderRadius.circular(borderradius),
      boxShadow: [
        BoxShadow(
          color: Colors.black54,
          offset: Offset(2.0, 2.0),
          blurRadius: 4.0
        )
      ]
    ),
    child: child,

  );

}

///
Widget configRowWidget(String text, Widget current) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      SizedBox(width: 20),
      Text(text),
      SizedBox(width: 20),
      current
    ],
  );
}



