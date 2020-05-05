import 'package:flutter/material.dart';

class SurveyCell extends StatefulWidget {
  SurveyCell({Key key}) : super(key: key);

  @override
  _SurveyCellState createState() => _SurveyCellState();
}

class _SurveyCellState extends State<SurveyCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Text(
                    '问卷名称',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/exam_time.png"),
              ),
              Expanded(
                child: Text(
                  '2020-04-16 16:51:24至2020-04-23 16:51:24',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/exam_fen.png"),
              ),
              Expanded(
                child: Text(
                  '总计3.00分（限时60分钟）',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Wrap(
            spacing: 2, //主轴上子控件的间距
            runSpacing: 5,
            children: <Widget>[
              Container(
                child: RaisedButton.icon(
                    icon: Container(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/exam_icon1.png"),
                    ),
                    label: Text(
                      '题目管理',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    color: Colors.white,
                    textColor: Colors.blue,
                    // onPressed: null,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      print("图标按钮");
                    }),
              ),
              Container(
                child: RaisedButton.icon(
                    icon: Container(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/exam_icon2.png"),
                    ),
                    label: Text(
                      '编辑问卷',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    color: Colors.white,
                    textColor: Colors.blue,
                    elevation: 0,
                    // onPressed: null,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      print("图标按钮");
                    }),
              ),
              Container(
                child: RaisedButton.icon(
                    icon: Container(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/exam_icon3.png"),
                    ),
                    label: Text(
                      '查看统计',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    color: Colors.white,
                    textColor: Colors.blue,
                    // onPressed: null,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      print("图标按钮");
                    }),
              ),
              Container(
                child: RaisedButton.icon(
                    icon: Container(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/exam_icon4.png"),
                    ),
                    label: Text(
                      '分享问卷',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    color: Colors.white,
                    textColor: Colors.blue,
                    elevation: 0,
                    // onPressed: null,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      print("图标按钮");
                    }),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
