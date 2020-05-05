import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; //toast
import 'package:image_picker/image_picker.dart';

import 'package:kkt/utils/net/Http.dart';

class ExamCreatePage extends StatefulWidget {
  ExamCreatePage({Key key}) : super(key: key);

  @override
  _ExamCreatePageState createState() => _ExamCreatePageState();
}

class _ExamCreatePageState extends State<ExamCreatePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey1 = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKey2 = new GlobalKey<ScaffoldState>();

  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);

  var _examNameController = new TextEditingController();
  var _examPeriodController = new TextEditingController();
  var _examMoneyController = new TextEditingController();

  // 考试分类
  var examCate = 0;

  // 考试模式
  var normalExam = true;
  var mockExam = false;
  var testExam = false;

  // 考试时间
  var examDate = '';
  var examTime = '';
  // 风格
  var curSty = 0;
  // 考题乱序
  var quesMess = false;
  // 考生模式
  var studentMode = 1;

  // 报名选项
  var signUpName = false;
  var signUpPhone = false;
  var signUpAllow = 1;

  // 报名审核
  var needJudge = 0;

  // 考试结束
  var showScore = false;
  var showRightRate = false;
  var showSpentTime = false;
  var showRank = false;

  // 考生结束
  var showAnswerBeforeEnd = 1;

  // 图片
  File _image;
  // 当图片上传成功后，记录当前上传的图片在服务器中的位置
  List imgFilePaths = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('创建考试'),
          bottom: TabBar(
            // isScrollable: true,
            // indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            // labelColor: Colors.black,
            // unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(
                text: '基础设置',
              ),
              Tab(
                child: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Text('附加设置'),
                    Positioned(
                        child: Container(
                          child: Image.asset("assets/images/more.png"),
                        ),
                        right: -50,
                        top: 0),
                  ],
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/editor');
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            CustomScrollView(shrinkWrap: true, key: _scaffoldKey1,
                // 内容
                slivers: <Widget>[
                  new SliverPadding(
                      padding: const EdgeInsets.all(10.0),
                      sliver: new SliverList(
                        delegate: new SliverChildListDelegate(<Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_name.png"),
                              ),
                              Text(
                                '考试名称',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new TextField(
                              style: hintTips,
                              controller: _examNameController,
                              decoration: new InputDecoration(
                                hintText: "请输入考试名称",
                              ),
                              obscureText: false,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_mode.png"),
                              ),
                              Text(
                                '考试模式',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.normalExam,
                                    onChanged: (v) {
                                      setState(() {
                                        this.normalExam = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('正式考试')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.mockExam,
                                    onChanged: (v) {
                                      setState(() {
                                        this.mockExam = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('模拟考试')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.testExam,
                                    onChanged: (v) {
                                      setState(() {
                                        this.testExam = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('练习考试')
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_time.png"),
                              ),
                              Text(
                                '考试时间',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                child: Text(examDate + " " + examTime),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: new MaterialButton(
                                      child: new Text('选择日期'),
                                      onPressed: () {
                                        // 调用函数打开
                                        showDatePicker(
                                          context: context,
                                          initialDate: new DateTime.now(),
                                          firstDate: new DateTime.now()
                                              .subtract(new Duration(
                                                  days: 30)), // 减 30 天
                                          lastDate: new DateTime.now().add(
                                              new Duration(days: 30)), // 加 30 天
                                        ).then((DateTime val) {
                                          print(val); // 2018-07-12 00:00:00.000
                                          if (null != val) {
                                            setState(() {
                                              examDate = val.toString();
                                            });
                                          } else {
                                            examDate = "";
                                          }
                                        }).catchError((err) {
                                          print(err);
                                          setState(() {
                                            examDate = "";
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: new MaterialButton(
                                      child: new Text('选择时间'),
                                      onPressed: () {
                                        // 调用函数打开
                                        showTimePicker(
                                          context: context,
                                          initialTime: new TimeOfDay.now(),
                                        ).then((val) {
                                          print(val);
                                          if (null != val) {
                                            setState(() {
                                              examTime = val.toString();
                                            });
                                          } else {
                                            examTime = "";
                                          }
                                        }).catchError((err) {
                                          setState(() {
                                            examTime = "";
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_time.png"),
                              ),
                              Text(
                                '考试时长',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new TextField(
                              style: hintTips,
                              controller: _examPeriodController,
                              decoration: new InputDecoration(
                                hintText: "请输入考试时长",
                              ),
                              obscureText: false,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_money.png"),
                              ),
                              Text(
                                '考试费用',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            child: new TextField(
                              style: hintTips,
                              controller: _examMoneyController,
                              decoration: new InputDecoration(
                                hintText: "请输入考试费用",
                              ),
                              obscureText: false,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                    "assets/images/exam_describe.png"),
                              ),
                              Text(
                                '考试说明',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_style.png"),
                              ),
                              Text(
                                '考试主题',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            child: new GridView.count(
                              shrinkWrap: true,
                              crossAxisSpacing: 10.0, //水平子 Widget 之间间距
                              mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
                              padding: EdgeInsets.all(10),
                              crossAxisCount: 8, //一行的 Widget 数量
                              // childAspectRatio:0.7,  //宽度和高度的比例
                              children: this._getStyleListData(),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 50,
                                height: 50,
                                child:
                                    Image.asset("assets/images/exam_cover.png"),
                              ),
                              Text(
                                '考试封面',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            child: new GridView.count(
                              shrinkWrap: true,
                              crossAxisSpacing: 10.0, //水平子 Widget 之间间距
                              mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
                              padding: EdgeInsets.all(10),
                              crossAxisCount: 3, //一行的 Widget 数量
                              // childAspectRatio:0.7,  //宽度和高度的比例
                              children: this._getImgListData(),
                            ),
                          ),
                          Container(
                            child: Center(
                              child: Text('可以上传六张图片，格式为jpg/png，且大小小于3M。'),
                            ),
                          )
                        ]),
                      ))
                ]),
            // Text('adsfds'),

            CustomScrollView(shrinkWrap: true, key: _scaffoldKey2,
                // 内容
                slivers: <Widget>[
                  new SliverPadding(
                      padding: const EdgeInsets.all(10.0),
                      sliver: new SliverList(
                          delegate: new SliverChildListDelegate(<Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '考试分类',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        new Container(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: new DropdownButtonHideUnderline(
                                child: new DropdownButton(
                              items: [
                                new DropdownMenuItem(
                                  child: new Text('默认'),
                                  value: 0,
                                ),
                                new DropdownMenuItem(
                                  child: new Text('商务'),
                                  value: 1,
                                ),
                              ],
                              hint: new Text('请选择'),
                              onChanged: (value) {
                                setState(() {
                                  examCate = value;
                                });
                              },
                              // isExpanded: true,
                              value: examCate,
                              // elevation: 24, //设置阴影的高度
                              style: new TextStyle(
                                //设置文本框里面文字的样式
                                color: Color(0xff4a4a4a),
                                fontSize: 14,
                              ),
//              isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
                              // iconSize: 40.0,
                            ))),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '考试乱序',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.quesMess,
                                    onChanged: (v) {
                                      setState(() {
                                        this.quesMess = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('考题乱序')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '考生模式',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text('(内部考生需要通过电脑登录添加)'),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 1,
                                    groupValue: this.studentMode,
                                    onChanged: (v) {
                                      setState(() {
                                        this.studentMode = v;
                                      });
                                    },
                                  ),
                                  Text('任何人')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: this.studentMode,
                                    onChanged: (v) {
                                      setState(() {
                                        this.studentMode = v;
                                      });
                                    },
                                  ),
                                  Text('内部考生')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child:
                                  Image.asset("assets/images/exam_signup.png"),
                            ),
                            Text(
                              '报名选项',
                              style: TextStyle(fontSize: 16),
                            ),
                            Expanded(
                              child: Text('(如需设置自定义报名选项请前往PC端设置)'),
                            ),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.signUpName,
                                    onChanged: (v) {
                                      setState(() {
                                        this.signUpName = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('姓名')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.signUpPhone,
                                    onChanged: (v) {
                                      setState(() {
                                        this.signUpPhone = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('手机号')
                                ],
                              ),
                            ]),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child:
                                  Image.asset("assets/images/exam_judge.png"),
                            ),
                            Text(
                              '报名审核',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 1,
                                    groupValue: this.needJudge,
                                    onChanged: (v) {
                                      setState(() {
                                        this.needJudge = v;
                                      });
                                    },
                                  ),
                                  Text('需要审核')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: this.needJudge,
                                    onChanged: (v) {
                                      setState(() {
                                        this.needJudge = v;
                                      });
                                    },
                                  ),
                                  Text('不需要审核')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '考试开始后可报名',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 1,
                                    groupValue: this.signUpAllow,
                                    onChanged: (v) {
                                      setState(() {
                                        this.signUpAllow = v;
                                      });
                                    },
                                  ),
                                  Text('允许')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: this.signUpAllow,
                                    onChanged: (v) {
                                      setState(() {
                                        this.signUpAllow = v;
                                      });
                                    },
                                  ),
                                  Text('不允许')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child:
                                  Image.asset("assets/images/exam_result.png"),
                            ),
                            Text(
                              '考试结束页面',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showScore,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showScore = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('成绩')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showRightRate,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showRightRate = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('正确率')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showSpentTime,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showSpentTime = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('考试用时')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showRank,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showRank = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('排行榜')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '考试结束前可查看正确答案和解析',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 1,
                                    groupValue: this.showAnswerBeforeEnd,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showAnswerBeforeEnd = v;
                                      });
                                    },
                                  ),
                                  Text('允许')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: this.showAnswerBeforeEnd,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showAnswerBeforeEnd = v;
                                      });
                                    },
                                  ),
                                  Text('不允许')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              child: Image.asset("assets/images/exam_mode.png"),
                            ),
                            Text(
                              '防作弊模式',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showScore,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showScore = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('切出微信强制交卷')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showRightRate,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showRightRate = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('禁止复制题目和选项')
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: this.showSpentTime,
                                    onChanged: (v) {
                                      setState(() {
                                        this.showSpentTime = v;
                                      });
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Text('无操作强制交卷')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]))),
                ]),
          ],
        ),
      ),
    );
  }

  List<Widget> _getImgListData() {
    Widget addImageBtn = Container(
      color: Colors.black54,
      child: RaisedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add,
              size: 56,
            ),
            Text('上传图片',
                style: TextStyle(
                  fontSize: 18,
                ))
          ],
        ),
        onPressed: () {
          showPickDialog();
        },
      ),
    );
    var tempList = imgFilePaths.map((imgFile) {
      return Container(
        alignment: Alignment.center,
        child: Image.file(imgFile),
      );
      // return Stack(
      //   children: <Widget>[
      //     new Container(
      //       alignment: Alignment.center,
      //       child: Image.file(imgFile),
      //     ),
      //     new Positioned(
      //       child: Container(
      //         child: IconButton(
      //           icon: Icon(Icons.close),
      //           onPressed: () {
      //             print('删除');
      //           },
      //         ),
      //       ),
      //       top: -5,
      //       right: -5,
      //     )
      //   ],
      // );
    });

    List<Widget> tmpList = tempList.toList();
    if (tmpList.length < 6) {
      tmpList.add(addImageBtn);
    }
    return tmpList;
  }

  List<Widget> _getStyleListData() {
    List listData = [
      {
        'r': 67,
        'g': 124,
        'b': 255,
        'o': 1.0,
      },
      {
        'r': 49,
        'g': 202,
        'b': 177,
        'o': 1.0,
      },
      {
        'r': 255,
        'g': 137,
        'b': 57,
        'o': 1.0,
      },
      {
        'r': 255,
        'g': 183,
        'b': 18,
        'o': 1.0,
      },
      {
        'r': 29,
        'g': 196,
        'b': 123,
        'o': 1.0,
      },
      {
        'r': 249,
        'g': 81,
        'b': 107,
        'o': 1.0,
      },
      {
        'r': 174,
        'g': 113,
        'b': 237,
        'o': 1.0,
      },
      {
        'r': 229,
        'g': 66,
        'b': 66,
        'o': 1.0,
      },
    ];

    var tempList = listData.map((value) {
      return Container(
        child: RaisedButton(
          child: (curSty == 1)
              ? Icon(
                  Icons.done,
                  size: 20,
                )
              : null,
          color: Color.fromRGBO(value['r'], value['g'], value['b'], value['o']),
          textColor: Colors.white,
          onPressed: () {
            print('set curty');
            setState(() {
              curSty = 1;
            });
          },
        ),
      );
    });
    return tempList.toList();
  }

  // 显示弹窗
  showPickDialog() {
    showModalBottomSheet(context: context, builder: _bottomPick);
  }

// 构建弹窗
  Widget _bottomPick(BuildContext context) {
    return initImgPick();
  }

  Future<String> getImgPick(ImageSource source) async {
    var tempImg = await ImagePicker.pickImage(source: source);
    imgFilePaths.add(tempImg);
    setState(() {
      _image = tempImg;
      imgFilePaths = imgFilePaths;
    });
  }

  Widget initImgPick() {
    return new Container(
        height: 170.0,
        child: new Column(
          children: <Widget>[
            new InkWell(
              child: new Container(
                child: new Text(
                  '拍照',
                  style: new TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                height: 60.0,
                alignment: Alignment.center,
              ),
              onTap: (() {
                Navigator.of(context).pop();
                getImgPick(ImageSource.camera);
              }),
            ),
            new Divider(
              height: 1.0,
            ),
            new InkWell(
              onTap: (() {
                Navigator.of(context).pop();
                getImgPick(ImageSource.gallery);
              }),
              child: new Container(
                child: new Text(
                  '从手机相册选择',
                  style: new TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                height: 60.0,
                alignment: Alignment.center,
              ),
            ),
            new Container(
              height: 5.0,
              color: new Color(0xfff2f2f2),
            ),
            new Container(
              child: new Text(
                '取消',
                style: new TextStyle(color: Colors.black, fontSize: 15.0),
              ),
              height: 40.0,
              alignment: Alignment.center,
            )
          ],
        ));
  }

  // 上传图片
  _uploadImage(File image) async {
    String filePath = image.path;
    String filename =
        filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);

    FormData formdata = FormData.fromMap(
        {"file": await MultipartFile.fromFile(filePath, filename: filename)});

    var respone = await Http.upload("/upload", formdata: formdata);
    if (respone.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "图片上传成功", gravity: ToastGravity.CENTER, textColor: Colors.grey);
    }
  }
}
