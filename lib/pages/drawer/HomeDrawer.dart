import 'package:flutter/material.dart';

class HomeDrawerPage extends StatefulWidget {
  HomeDrawerPage({Key key}) : super(key: key);

  @override
  _HomeDrawerPageState createState() => _HomeDrawerPageState();
}

class _HomeDrawerPageState extends State<HomeDrawerPage> {
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
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu1.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("管理中心"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          leading: Container(
            width: 30,
            height: 30,
            child: Image.asset("assets/images/fmenu2.png"),
          ),
          trailing: new Icon(Icons.arrow_right),
          title: Text("登录/注册"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/login');
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
          title: Text("用户中心"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushNamed(context, '/profile');
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
            child: Image.asset("assets/images/fmenu4.png"),
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
            child: Image.asset("assets/images/fmenu6.png"),
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
            child: Image.asset("assets/images/fmenu5.png"),
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
    // var yy = SingleChildScrollView(
    //   physics: BouncingScrollPhysics(),
    //   child: xx,
    // );
    return menus;
  }
}
