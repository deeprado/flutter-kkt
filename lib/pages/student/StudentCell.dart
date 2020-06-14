import 'package:flutter/material.dart';

class StudentCell extends StatefulWidget {
  final int id;
  final String name;
  final String mobile;
  final String avatar;
  final String groupName;

  StudentCell(this.id, this.name, this.mobile, this.avatar, this.groupName);

  @override
  _StudentCellState createState() => _StudentCellState(
      id: id, name: name, mobile: mobile, avatar: avatar, groupName: groupName);
}

class _StudentCellState extends State<StudentCell> {
  int id = 1;
  String mobile = '13600000000';
  String name = 'xx';
  String avatar =
      'https://up.enterdesk.com/edpic/a5/6d/7a/a56d7acfa5df7b8a30da143bddd290e2.jpg';
  String groupName = 'xx';

  _StudentCellState(
      {this.id, this.name, this.mobile, this.avatar, this.groupName});

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
                    child: Image.network(this.avatar,
                        fit: BoxFit.cover, height: 60, width: 60),
                  ),
                  title: Text(this.name),
                  subtitle: Text(this.mobile),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Text(this.groupName),
              )
            ],
          )
        ],
      ),
    );
  }
}
