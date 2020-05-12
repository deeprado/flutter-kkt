import 'package:flutter/material.dart';

import 'package:kkt/widget/player_widget.dart';

const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';

class QuesCell extends StatefulWidget {
  QuesCell({Key key}) : super(key: key);

  @override
  _QuesCellState createState() => _QuesCellState();
}

class _QuesCellState extends State<QuesCell> {
  var answer = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    flex: 1,
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
                          width: 5,
                        ),
                        Text(
                          '[单选题]',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            '驾驶人有下列哪种违法行为一次记6分？',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
                      print('aaaa');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('正确答案：',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ),
                Text('A',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
            ExpansionTile(
              title: Text('aaaa'),
              trailing: Icon(Icons.chevron_right),
              children: <Widget>[
                Column(
                  children: <Widget>[
                    PlayerWidget(url: kUrl1),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: this.answer,
                          onChanged: (v) {
                            setState(() {
                              this.answer = v;
                            });
                          },
                        ),
                        Text('选项A')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: this.answer,
                          onChanged: (v) {
                            setState(() {
                              this.answer = v;
                            });
                          },
                        ),
                        Text('选项B')
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                          value: 3,
                          groupValue: this.answer,
                          onChanged: (v) {
                            setState(() {
                              this.answer = v;
                            });
                          },
                        ),
                        Text('选项C')
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('正确答案：',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                    ),
                    Text('A',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('难度：',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87)),
                    ),
                    Text('简单',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('答案解析：',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                      '患者呈昏迷状态,肌力为0级,应安排在重症监护室,并将备用床改为暂空床。病区值班护士接到住院处通知后,立即根据患者病情需要准备患者床单位。 将备用床改为暂空床,备齐患者所需用物;危、重患者如循环功能失代偿,严重创伤、大手术,严重水电解质紊乱及酸碱平衡失调,需要严密监测呼吸功能的患者应安置在危重病室,并在床单上加铺橡胶单和中单。',
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ),
              ],
            )
          ],
        ));
  }
}
