//营造效果，导入异步包
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';

import 'package:kkt/app/HttpRequest.dart';

import 'package:kkt/pages/student/StudentCell.dart';
import 'package:kkt/pages/drawer/StudentDrawer.dart';

/// 考生

// 刷新状态枚举
enum LoadingStatus {
  // 正在加载中
  STATUS_LOADING,
  // 数据加载完毕
  STATUS_COMPLETED,
  // 空闲状态
  STATUS_IDEL
}

class StudentListPage extends StatefulWidget {
  StudentListPage({Key key}) : super(key: key);

  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  // 考生列表
  static bool loadEnd = false;

  // 限制一滑动到最下方就刷新，在刷新数据 及 刷新完之后改变状态
  static var loadStatus = LoadingStatus.STATUS_IDEL;
  static int pageCount = 1;

  // 自定义进度条颜色
  static var lAnimColor = AlwaysStoppedAnimation(Colors.red);
  static var cAnimColor = AlwaysStoppedAnimation(Colors.blue);

  // 线性进度条
  static var myLPI = new LinearProgressIndicator(
    backgroundColor: Colors.grey,
    valueColor: lAnimColor,
    value: 0.5,
  );

  // 环形进度条
  static var myCPI = new CircularProgressIndicator(
    backgroundColor: Colors.grey,
    valueColor: cAnimColor,
    value: 0.8,
  );

  // ProgressIndicator 演示
  var body1 = new Column(children: <Widget>[
    Padding(child: myLPI, padding: EdgeInsets.fromLTRB(0, 20, 0, 40)),
    myCPI
  ]);

  // 定义整个页面的数据源 list
  static List studentList = new List();

  // 定义加载中默认文字
  String loadText = "加载中...";

  // 定义 ListView 的监听， ScrollController ScrollController 能够添加对ListView的滑动监听
  ScrollController _scrollController = new ScrollController();

  // 定义两个加padding方法
  Widget _pada(Widget widget, var value) {
    return new Padding(padding: EdgeInsets.all(value), child: widget);
  }

  Widget _pad(Widget widget, {l, t, r, b}) {
    return new Padding(
        padding:
            EdgeInsets.fromLTRB(l ??= 0.0, t ??= 0.0, r ??= 0.0, b ??= 0.0),
        child: widget);
  }

  // 加载中的布局
  Widget _loadingView() {
    var loadingTS = TextStyle(color: Colors.blue, fontSize: 16);
//    var loadingText=new Opacity(opacity: loadStatus==LoadingStatus.STATUS_LOADING?1.0:0,child:_pad(Text(loadText,style: loadingTS),l:20.0));
    var loadingText = _pad(Text(loadText, style: loadingTS), l: 20.0);
//    var loadingIndicator=new Opacity(opacity: loadStatus==LoadingStatus.STATUS_LOADING?1.0:0,child:SizedBox(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.blue)),width: 20.0,height: 20.0,));
    var loadingIndicator = new Visibility(
        visible: loadStatus == LoadingStatus.STATUS_LOADING ? true : false,
        child: SizedBox(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue)),
          width: 20.0,
          height: 20.0,
        ));

    return _pad(
        Row(
          children: <Widget>[loadingIndicator, loadingText],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        t: 20.0,
        b: 20.0);
  }

  @override
  void initState() {
    // 在初始化状态中 准备第一页数据
    _getMoreData(pageCount);

    // 在初始化状态的方法里 设置ListView的监听
    _scrollController.addListener(() {
      print('上滑加载');
      // 判断 当滑动到最底部的时候，去加载更多的数据
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // 此时加载下一页数据
        _getMoreData(pageCount + 1);
      }
    });
  }

  Future<void> _doRefresh() async {
    print('下拉刷新');
    setState(() {
      loadText = '加载中...';
      loadStatus = LoadingStatus.STATUS_LOADING;
      studentList.clear();
    });

    Map<String, int> params = new Map();
    params['page'] = 1;
    //
    final studentUrl = 'http://localhost:9081/student/list';
    HttpRequest.getHttp(studentUrl, parameters: params, onSuccess: (res) {
      var data = json.decode(res);
      var moreList = data['data']['list'];
      var tmpLoadEnd = data['data']['loadEnd'];

      // 准备完数据后，在设置状态
      setState(() {
        studentList.addAll(moreList);
        pageCount = 1;
        loadEnd = tmpLoadEnd;
        // 加载完毕
        loadText = '加载完毕';
        loadStatus = LoadingStatus.STATUS_COMPLETED;
      });
    }, onError: (error) {
      print(error);
    });
  }

  Widget buildStudent(index) {
    var item = studentList[index];
    return StudentCell(item['id'], item['name'], item['mobile'], item['avatar'],
        item['groupName']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('考生列表'),
        ),
        body: new RefreshIndicator(
            child: new ListView.builder(
              itemCount: studentList.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == studentList.length) {
                  return _loadingView();
                } else {
                  return buildStudent(index);
                }
              },
              controller: _scrollController,
            ),
            onRefresh: _doRefresh));
  }

  // 获取完更多数据，然后给控件setState 让控件进行数据更新
  Future _getMoreData(int page) async {
    if (loadStatus == LoadingStatus.STATUS_IDEL) {
      // 先设置状态，防止往下拉就直接加载数据
      setState(() {
        loadStatus = LoadingStatus.STATUS_LOADING;
      });
    }
    List moreList;
    // 若没有加载完毕
    if (!loadEnd) {
      // 异步准备数据
      Map<String, int> params = new Map();
      params['page'] = page;
      //
      final studentUrl = 'http://localhost:9081/student/list';
      HttpRequest.getHttp(studentUrl, parameters: params, onSuccess: (res) {
        var data = json.decode(res);
        moreList = data['data']['list'];
        var tmpLoadEnd = data['data']['loadEnd'];

        // 准备完数据后，在设置状态
        setState(() {
          studentList.addAll(moreList);
          pageCount = page;
          loadEnd = tmpLoadEnd;
          // 加载完毕
          loadText = '加载完毕';
          loadStatus = LoadingStatus.STATUS_COMPLETED;
        });
      }, onError: (error) {
        print(error);
      });
    }

    // 准备完数据后，在设置状态
    setState(() {
      if (!loadEnd) {
        loadStatus = LoadingStatus.STATUS_IDEL;
        loadText = '加载中...';
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
