import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    var menus = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("deepado"),
          accountEmail: Text("2746143402@qq.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage:
                NetworkImage("https://www.itying.com/images/flutter/3.png"),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage("https://www.itying.com/images/flutter/2.png"),
            fit: BoxFit.cover,
          )),
          otherAccountsPictures: <Widget>[
            Image.network("https://www.itying.com/images/flutter/4.png"),
            Image.network("https://www.itying.com/images/flutter/5.png"),
          ],
        ),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("首页"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("组件示例"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/demo/widght');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("渐变进度"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/demo/progress');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("音频播放"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/demo/audio');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("视频播放"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/demo/video');
          },
        ),
        Divider(),
        Container(
          child: Image.asset("assets/images/fmenu_banner.png"),
        ),
      ],
    );
    return menus;
  }
}
