import 'package:flutter/material.dart';

class StudentCell extends StatefulWidget {
  StudentCell({Key key}) : super(key: key);

  @override
  _StudentCellState createState() => _StudentCellState();
}

class _StudentCellState extends State<StudentCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: ClipOval(
                    child: Image.network(
                        "https://www.itying.com/images/flutter/2.png",
                        fit: BoxFit.cover,
                        height: 60,
                        width: 60),
                  ),
                  title: Text("xxxx"),
                  subtitle: Text("xxxxxxx"),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Text('默认'),
              )
            ],
          )
        ],
      ),
    );
  }
}
