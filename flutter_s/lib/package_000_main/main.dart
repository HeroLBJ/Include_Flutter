import 'package:flutter/material.dart';
import 'package:flutter_s/package_000_main/JumpInfo.dart';
import 'package:flutter_s/package_001_default/app_001.dart';

void main() => runApp(MyApp());

getJumpData() {
  List<JumpInfo> list = List();
  list.add(JumpInfo(route: '/app_001', name: 'TabBar的使用'));
  list.add(JumpInfo(route: '/app_002', name: '模拟知乎列表页面'));
  list.add(JumpInfo(route: '/app_003', name: 'Provider的使用'));
  return list;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List jumpDataList = getJumpData();
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/app_001': (context) => App001(title: jumpDataList[0].name),
        '/app_002': (context) => App001(title: jumpDataList[1].name),
        '/app_003': (context) => App001(title: jumpDataList[2].name),
      },
      debugShowCheckedModeBanner: false,
      title: 'FlutterS',
      home: Scaffold(
          appBar: AppBar(title: Text('FlutterS')),
          body: ListView.builder(
              itemCount: jumpDataList.length,
              itemBuilder: (BuildContext context, int count) {
                return HomeListItemPage(
                    index: count, jumpInfo: jumpDataList[count]);
              })),
    );
  }
}

class HomeListItemPage extends StatelessWidget {
  final JumpInfo jumpInfo;
  final int index;

  HomeListItemPage({@required this.jumpInfo, @required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(jumpInfo.route);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${index + 1}.${jumpInfo.name}',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              color: Colors.black26,
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
