import 'package:flutter/material.dart';

class App001 extends StatefulWidget {
  String title;

  App001({this.title});

  @override
  _App001State createState() => _App001State(title: title);
}

class _App001State extends State<App001> with TickerProviderStateMixin {
  String title;
  TabController _tabController;

  _App001State({this.title});

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: TabBar(
          isScrollable: true,
          // 设置可以左右滑动
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: Colors.cyanAccent,
          labelStyle: TextStyle(fontSize: 20),
          labelPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: TextStyle(fontSize: 15),
          indicatorPadding: EdgeInsets.only(top: 5, bottom: 2),
          indicatorColor: Colors.amberAccent,
          controller: _tabController,
          tabs: <Widget>[
            Text('红色'),
            Text('浅红'),
            Text('蓝色'),
            Text('浅蓝'),
            Text('绿色'),
            Text('浅绿'),
          ],
          onTap: (index) {
            print('选中的是第$index个');
          },
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            color: Colors.red,
            child: Center(
                child: Text(
              '红色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
          Container(
            color: Colors.redAccent,
            child: Center(
                child: Text(
              '浅红',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
          Container(
            color: Colors.blue,
            child: Center(
                child: Text(
              '蓝色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
          Container(
            color: Colors.blueAccent,
            child: Center(
                child: Text(
              '浅蓝',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
          Container(
            color: Colors.green,
            child: Center(
                child: Text(
              '绿色',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
          Container(
            color: Colors.greenAccent,
            child: Center(
                child: Text(
              '浅绿',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          )
        ],
      ),
    );
  }
}
