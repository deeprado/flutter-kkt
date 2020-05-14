import 'package:flutter/material.dart';

class TabDrawerPage extends StatefulWidget {
  TabDrawerPage({Key key}) : super(key: key);

  @override
  _TabDrawerPageState createState() => _TabDrawerPageState();
}

class _TabDrawerPageState extends State<TabDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("创建考试"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/user');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("创建问卷"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/user');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("个人中心"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/user');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("帮助中心"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/help');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("关于我们"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/about');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("在线客服"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/feedback');
          },
        ),
        Divider(),
        Container(
          child: Image.asset("assets/images/fmenu_banner.png"),
        ),
      ],
    );
  }
}
