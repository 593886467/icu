import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';
import 'package:icu/pages/fire/M/banner_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';



Widget configBanner(BuildContext context, List<Data> list) {
  return SliverToBoxAdapter(
    child: buildBannerWidget(context, list),
  );
}

Widget buildBannerWidget(BuildContext context, List<Data> list) {
  final double w = SizeMacro().screenWidth;
  final double h =  SizeMacro().screenWidth / 16 * 7;
  if(ObjectUtil.isEmpty(list)) {
    return Container(height: 0.0,);
  }
  return Container(
    width: w,
    height: h,
    padding: EdgeInsets.only(top: 10),
    child: Swiper(
        itemCount: list.length,
        autoplay: true,
        viewportFraction: 0.9,
        scale: 0.95,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              color: Colors.white.withOpacity(0.5),
              activeColor: Colors.white,
            ),
            margin: EdgeInsets.all(SizeMacro().setWidth(10))
        ),

        itemBuilder:  (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              print('点击');
              RouteManager.pushWeb(context,title: list[index].title ,url: list[index].url);
            },

              child: configImage(
                  list[index].imagePath,
                  w,
                  h,
                  BorderRadius.circular(10))
          );
        }
    ),
  );
}

class ArticleItemPage extends StatelessWidget{

  const ArticleItemPage(
      this._model, {
        Key key,
        this.onTap
  }):super(key: key);

  final VoidCallback onTap;
  final ReposModel _model;


  /*生命周期*/
  @override
  Widget build(BuildContext context) {
    return createBody(context);
  }

  /*触发方法*/


  /*构建视图*/

  /// 创建body
   Widget createBody(BuildContext context) {
     return InkWell(
       onTap:() {
         RouteManager.pushWeb(context,title: _model.title ,url: _model.link);
       },

       child: Container(
         color: ColorsMacro.col_F7F,
         padding: EdgeInsets.only(left: 15,top: 10,right: 15),
         child: createItems(context),
       )
     );
   }

   /// 创建列表item
   Widget createItems(BuildContext context) {
     return Container(
       padding: EdgeInsets.only(left: 10),
       decoration: BoxDecoration(
           gradient: LinearGradient(colors:[ColorsMacro.col_FFF,ColorsMacro.col_FFF]), //背
           borderRadius: BorderRadius.circular(15),
             boxShadow: [ //阴影
               BoxShadow(
                   color:ColorsMacro.col_EEE,
                   offset: Offset(2.0,2.0),
                   blurRadius: 4.0
               )
             ]
         ),

       child: Row(
         children: <Widget>[
           Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     _model.title,
                     maxLines: 1,
                     overflow: TextOverflow.ellipsis,
                     style: TextStyleMacro.titleBloD163,
                   ),
                   Gaps.vGap10,
                   Text(
                       _model.desc,
                       maxLines: 3,
                       overflow: TextOverflow.ellipsis,
                       style: TextStyleMacro.titleNor146
                   ),
                   Gaps.vGap10 ,
                   new Row(
                     children: <Widget>[
                       Text(
                         _model.collect ? "已收藏" :"收藏",
                         style: TextStyleMacro.titleNor126,
                       ),
                       Gaps.hGap10,
                       Text(
                         _model.author,
                         style: TextStyleMacro.titleNor126,
                       ),
                       Gaps.hGap10,
                       Text(
                         Utils.getTimeLine(context, _model.publishTime),
                         style: TextStyleMacro.titleNor126,
                       ),
                     ],
                   )
                 ],
               )
           ),
           Container(
               width: 72,
               alignment: Alignment.center,
               margin: EdgeInsets.all(10),
               decoration: BoxDecoration(
                   boxShadow: [ //阴影
                     BoxShadow(
                         color:ColorsMacro.col_333,
                         offset: Offset(2.0,2.0),
                         blurRadius: 4.0
                     )
                   ]
               ),
               child: configImage(_model.envelopePic, 72, 128, BorderRadius.all(Radius.circular(4.0)))
           )
         ],
       ),
     );
   }
}

class HeaderItem extends StatelessWidget {
  const HeaderItem(
      {this.margin,
        this.titleColor,
        this.leftIcon,
        this.titleId,
        this.title,
        this.extraId,
        this.extra,
        this.rightIcon,
        this.onTap,
        Key key})
      : super(key: key);

  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 56.0,
      margin: margin ?? EdgeInsets.only(top: 0.0),
      child: new ListTile(
          onTap: onTap,
          title: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Icon(
                leftIcon ?? Icons.whatshot,
                color: titleColor ?? Colors.blueAccent,
              ),
              Gaps.hGap10,
              new Expanded(
                  child: new Text(
                    title ?? '分类',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: titleColor ?? Colors.blueAccent,
                        fontSize: 16),
                  ))
            ],
          ),
          trailing: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Text(
                extra ?? '更多',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              new Icon(
                rightIcon ?? Icons.keyboard_arrow_right,
                color: Colors.grey,
              ),
            ],
          )),
      decoration: new BoxDecoration(
        //new Border.all(width: 0.33, color: Colours.divider)
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: ColorsMacro.col_E5E))),
    );
  }
}





