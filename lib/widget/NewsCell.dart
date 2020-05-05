import 'package:flutter/material.dart';

class NewsCell extends StatefulWidget {
  final String title;
  final  String describe;
  final String date;
  final  String kanCount;
  final String zanCount;

  NewsCell(
      {this.title, this.describe, this.date, this.kanCount, this.zanCount});

  @override
  _NewsCellState createState() => _NewsCellState(
      title: title,
      describe: describe,
      date: date,
      kanCount: kanCount,
      zanCount: zanCount);
}

class _NewsCellState extends State<NewsCell> {
  String title = '';
  String describe = '';
  String date = '';
  String kanCount = '';
  String zanCount = '';

  _NewsCellState(
      {this.title, this.describe, this.date, this.kanCount, this.zanCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 76.0,
                width: 115.0,
                child: Image.network(
                  'https://upload.kuaikaoti.com/uploads/gift_pics/20191120/1574229523.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff111111),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      describe,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xff111111),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(date),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40,
                      height: 24,
                      child: Image.asset("assets/images/kan.png"),
                    ),
                    Text(kanCount),
                    Container(
                      width: 40,
                      height: 24,
                      child: Image.asset("assets/images/zan.png"),
                    ),
                    Text(zanCount),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
