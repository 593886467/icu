import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';
import 'package:flutter/cupertino.dart';


/// 加载网路图片
Widget configImage(String url, double width, double height,BorderRadius borderRadius) {
  return ClipRRect(
    borderRadius: borderRadius,
    child: CachedNetworkImage(
      width: width,
      height: height,
      fit: BoxFit.fill,
      imageUrl: url,
      placeholder: (BuildContext context, String url) {
        return new ProgressView();
      },
      errorWidget: (BuildContext context, String url, Object error) {
        return new Icon(Icons.error);
      },
      fadeOutDuration: const Duration(seconds: 1),
      fadeInDuration: const Duration(seconds: 1),
    ),
  );
}


class TTProgressBar extends StatefulWidget {

  double progress;
  TTProgressBar({
    this.progress,
    Key key
  }):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return TTProgressBarState();
  }
}

class TTProgressBarState extends State<TTProgressBar> with SingleTickerProviderStateMixin{

  AnimationController _animationController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: ttProgressBar(widget.progress, context));
  }

  @override
  void initState() {

    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 0));
    _animationController.forward();
    super.initState();
  }

  Widget ttProgressBar(double progress, BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
       backgroundColor: Colors.blueAccent.withOpacity(0),
       value:  progress == 1.0 ? 0 : progress,
       valueColor: ColorTween(
         begin: Colors.grey,
         end: Colors.red
         ).animate(_animationController)
      ),
     height: 2,
    );
  }
}



//ColorTween(
//begin: Colors.grey,
//end: Colors.red
//).animate(_animationController)




