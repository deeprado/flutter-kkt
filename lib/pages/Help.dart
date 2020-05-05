import 'package:flutter/material.dart';

// import 'package:flui/flui.dart';

import 'package:kkt/widget/NewsCell.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: '帮助中心',
              ),
              Tab(
                text: '常见问题',
              ),
              Tab(
                text: '行业动态',
              ),
              Tab(
                text: '平台公告',
              ),
            ],
          ),
          title: Text('帮助中心'),
        ),
        body: TabBarView(
          children: [
            Column(
              children: <Widget>[
                new NewsCell(
                    title: 'aaaaaaa',
                    describe: 'bbbbbbbbbbb',
                    date: '2020/11/22',
                    zanCount: '20',
                    kanCount: '30'),
                Divider(),
                new NewsCell(
                    title: 'aaaaaaa',
                    describe: 'bbbbbbbbbbb',
                    date: '2020/11/22',
                    zanCount: '20',
                    kanCount: '30'),
                Divider(),
                new NewsCell(
                    title: 'aaaaaaa',
                    describe: 'bbbbbbbbbbb',
                    date: '2020/11/22',
                    zanCount: '20',
                    kanCount: '30'),
              ],
            ),
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
