import 'package:flutter/material.dart';

class BankCell extends StatefulWidget {
  BankCell({Key key}) : super(key: key);

  @override
  _BankCellState createState() => _BankCellState();
}

class _BankCellState extends State<BankCell> {
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
                Container(
                    child: Row(
                  children: <Widget>[
                    Text(
                      '1.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '默认',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      print('进入题目列表');
                      Navigator.pushNamed(context, '/ques/list');
                    },
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '2',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            '题',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '单选题',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 20, child: VerticalDivider(color: Colors.grey)),
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '2',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            '题',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '单选题',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 20, child: VerticalDivider(color: Colors.grey)),
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '2',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            '题',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '单选题',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                Container(
                    height: 20, child: VerticalDivider(color: Colors.grey)),
                Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '2',
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            '题',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '单选题',
                        style: TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
