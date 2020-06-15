import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:kkt/utils/screen_util.dart';
import 'package:kkt/app/HttpRequest.dart';

import 'package:kkt/pages/student/StudentCell.dart';
import 'package:kkt/pages/drawer/StudentDrawer.dart';

/// 考生

class StudentPage extends StatefulWidget {
  StudentPage({Key key}) : super(key: key);

  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  var _fieldNameController = new TextEditingController();

  var studentList = [];

  @override
  void initState() {
    super.initState();
    var permission =
        PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    print("permission status is " + permission.toString());
    PermissionHandler().requestPermissions(<PermissionGroup>[
      PermissionGroup.storage, // 在这里添加需要的权限
    ]);

    // 获取考生
    _getMoreData(1);
  }

  Future _getMoreData(int page) async {
    Map<String, int> params = new Map();
    params['page'] = page;

    //
    final studentUrl = 'http://localhost:9081/student/list';
    HttpRequest.getHttp(studentUrl, parameters: params, onSuccess: (res) {
      var data = json.decode(res);
      setState(() {
        studentList = data['data']['list'];
      });
      print('eeeeeeeeeeeeee');
    }, onError: (error) {
      print(error);
    });
  }

  Widget buildStudents() {
    List<Widget> studentEles = [];
    for (var item in studentList) {
      studentEles.add(StudentCell(item['id'], item['name'], item['mobile'],
          item['avatar'], item['groupName']));
      studentEles.add(SizedBox(
        height: 10,
      ));
    }
    return new SliverPadding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      sliver:
          new SliverList(delegate: new SliverChildListDelegate(studentEles)),
    );
  }

  Widget buildTestStudents() {
    return new SliverPadding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      sliver: new SliverList(
        delegate: new SliverChildListDelegate(<Widget>[
          StudentCell(
              1,
              'aa',
              'bb',
              'https://up.enterdesk.com/edpic/a5/6d/7a/a56d7acfa5df7b8a30da143bddd290e2.jpg',
              'ddd'),
          SizedBox(
            height: 10,
          ),
          StudentCell(
              1,
              'aa',
              'bb',
              'https://up.enterdesk.com/edpic/a5/6d/7a/a56d7acfa5df7b8a30da143bddd290e2.jpg',
              'ddd'),
          SizedBox(
            height: 10,
          ),
          StudentCell(
              1,
              'aa',
              'bb',
              'https://up.enterdesk.com/edpic/a5/6d/7a/a56d7acfa5df7b8a30da143bddd290e2.jpg',
              'ddd'),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('考生管理'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.pushNamed(context, '/student/list');
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/student/create');
            },
          ),
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              print('导入');
              Navigator.pushNamed(context, '/demo/file');
            },
          ),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                child: SimpleDialog(
                  title: const Text('操作提示'),
                  children: <Widget>[
                    Center(
                      child: Text(
                        '如何使用考生账号？',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        '第一步：维护考生字段，添加考生账号信息',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        '第二步：将主页链接或地址发送给考生',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        '第三步：考生扫描进入主页页面，填写对应考生信息绑定',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        '考生主页链接：',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        'http://ti.aakuai.top/wx/group/index/UGJaYggw',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: Text(
                        '扫描二维码进入考生主页',
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      // color: Colors.blue,
                      child: Image.network(
                        'https://flutterchina.club/images/assets-and-images/icon.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                    Container(
                      width: 100,
                      child: RaisedButton(
                          child: Text('下载二维码'),
                          onPressed: () {
                            _saveImg();
                          }),
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.announcement),
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  child: new AlertDialog(
                    title: new Text("字段维护"),
                    content: Container(
                      child: Column(
                        children: <Widget>[
                          new TextField(
                            style: hintTips,
                            controller: _fieldNameController,
                            decoration: new InputDecoration(
                                hintText: "请输入字段名称", icon: Icon(Icons.ac_unit)),
                            obscureText: false,
                          ),
                          new TextField(
                            style: hintTips,
                            controller: _fieldNameController,
                            decoration: new InputDecoration(
                                hintText: "请输入字段名称", icon: Icon(Icons.ac_unit)),
                            obscureText: false,
                          ),
                          new TextField(
                            style: hintTips,
                            controller: _fieldNameController,
                            decoration: new InputDecoration(
                                hintText: "请输入字段名称", icon: Icon(Icons.ac_unit)),
                            obscureText: false,
                          ),
                          new TextField(
                            style: hintTips,
                            controller: _fieldNameController,
                            decoration: new InputDecoration(
                                hintText: "请输入字段名称", icon: Icon(Icons.ac_unit)),
                            obscureText: false,
                          ),
                          new TextField(
                            style: hintTips,
                            controller: _fieldNameController,
                            decoration: new InputDecoration(
                                hintText: "请输入字段名称", icon: Icon(Icons.ac_unit)),
                            obscureText: false,
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: new Text("确定")),
                      new FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            print("点击取消------");
                          },
                          child: new Text("取消")),
                    ],
                  ));
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
      endDrawer: new Drawer(
        child: new StudentDrawerPage(),
      ),
      body: SafeArea(
        child: new CustomScrollView(
          shrinkWrap: true,
          // 内容
          slivers: <Widget>[
            this.buildStudents(),
            // this.buildTestStudents(),
          ],
        ),
      ),
    );
  }

  // 申请权限
  // Future<bool> _checkPermission() async {
  //   // 先对所在平台进行判断
  //   if (Theme.of(context).platform == TargetPlatform.android) {
  //     PermissionStatus permission = await PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.storage);
  //     if (permission != PermissionStatus.granted) {
  //       Map<PermissionGroup, PermissionStatus> permissions =
  //           await PermissionHandler()
  //               .requestPermissions([PermissionGroup.storage]);
  //       if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
  //         return true;
  //       }
  //     } else {
  //       return true;
  //     }
  //   } else {
  //     return true;
  //   }
  //   return false;
  // }

  // 获取存储路径
  Future<String> _findLocalPath() async {
    // 因为Apple没有外置存储，所以第一步我们需要先对所在平台进行判断
    // 如果是android，使用getExternalStorageDirectory
    // 如果是iOS，使用getApplicationSupportDirectory
    final directory = Theme.of(context).platform == TargetPlatform.android
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
    return directory.path;
  }

  save() async {
    // 获取存储路径
    var _localPath = (await _findLocalPath()) + '/Download';

    final savedDir = Directory(_localPath);
// 判断下载路径是否存在
    bool hasExisted = await savedDir.exists();
// 不存在就新建路径
    if (!hasExisted) {
      savedDir.create();
    }
  }

  _saveImg() async {
    var response = await Dio().get(
        "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/image/h%3D300/sign=a62e824376d98d1069d40a31113eb807/838ba61ea8d3fd1fc9c7b6853a4e251f94ca5f46.jpg",
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
  }
}
