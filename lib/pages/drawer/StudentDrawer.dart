import 'package:flutter/material.dart';

class StudentDrawerPage extends StatefulWidget {
  StudentDrawerPage({Key key}) : super(key: key);

  @override
  _StudentDrawerPageState createState() => _StudentDrawerPageState();
}

class _StudentDrawerPageState extends State<StudentDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                child: UserAccountsDrawerHeader(
              accountName: Text("deepado"),
              accountEmail: Text("2746143402@qq.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://www.itying.com/images/flutter/3.png"),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image:
                    NetworkImage("https://www.itying.com/images/flutter/2.png"),
                fit: BoxFit.cover,
              )),
              otherAccountsPictures: <Widget>[
                Image.network("https://www.itying.com/images/flutter/4.png"),
                Image.network("https://www.itying.com/images/flutter/5.png"),
              ],
            ))
          ],
        ),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        ListTile(
          trailing: new Icon(Icons.arrow_right),
          title: Text("全部"),
          onTap: () {
            Navigator.of(context).pop(); //隐藏侧边栏
            Navigator.pushReplacementNamed(context, '/tabs');
          },
        ),
        Divider(),
        Expanded(
          child: Container(
            child: Image.asset("assets/images/fmenu_banner.png"),
          ),
        )
      ],
    );
  }
}
