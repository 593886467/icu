import 'package:flutter/material.dart';
import 'package:icu/current_index.dart';
import 'package:icu/pages/wood/V/tabpageV.dart';

class TabPage extends StatefulWidget {

  const TabPage({Key key, this.labelId, this.title, this.titleId, this.treeModel})
  : super(key: key);

  final String labelId;
  final String title;
  final String titleId;
  final TreeModel treeModel;

  @override
  State<StatefulWidget> createState() {
    return TabPageState();
  }
}


class TabPageState extends State<TabPage> {

  List<BlocProvider<ComListBloc>> _children = List();

  /*重写方法*/

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final TabBloc bloc = BlocProvider.of<TabBloc>(context);
    bloc.bindSystemData(widget.treeModel);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.title ?? "测试",
        ),
        centerTitle: true,
      ),

      body: StreamBuilder(

          // ignore: missing_return
          builder:(BuildContext context, AsyncSnapshot<List<TreeModel>> snapshot) {
            if(snapshot.data == null) {
              Observable.just(1)
                  .delay(Duration(milliseconds: 500))
                  .listen((event) {
                    bloc.getData(data:{'labelId':widget.labelId});
              });
              return  ProgressView();
            }
            _children =snapshot.data.map((TreeModel model){
              return BlocProvider<ComListBloc>(
                child: ComListPage(
                  labelId: widget.labelId,
                  cid: model.id,
                ),
                bloc: ComListBloc(),
              );
            }).cast<BlocProvider<ComListBloc>>()
            .toList();

            return DefaultTabController(
                length: snapshot.data == null ? 0 : snapshot.data.length,
                child: Column(
                  children: <Widget>[
                    Material(
                      color: Theme.of(context).primaryColor,
                      child: SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: TabBar(
                          isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: snapshot.data?.map((TreeModel model)
                            => Tab(text: model.name))?.toList(),
                        ),
                      ),
                    ),
                    Expanded(child: TabBarView(children: _children))
                  ]
                )
            );
          },
          stream: bloc.tabTreeStream,
      ),
    );
  }


  @override
  void dispose() {
    for(int i = 0, length = _children.length; i <length;i++) {
      _children[i].bloc.dispose();
    }
    super.dispose();
  }





}

