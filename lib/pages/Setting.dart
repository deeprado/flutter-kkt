import 'package:flutter/material.dart';

import 'package:flui/flui.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _switchValue = false;

  handleTap() {
    print('tap cell');
  }

  onChanged(bool value) => setState(() => _switchValue = value);

  List<FLStaticSectionData> _buildList() {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color bgColor = Theme.of(context).backgroundColor;
    return [
      FLStaticSectionData(headerTitle: '账号', itemList: [
        FLStaticItemData(
            title: '账号管理',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onTap: handleTap),
        FLStaticItemData(
            title: '账号安全',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onTap: handleTap),
      ]),
      FLStaticSectionData(headerTitle: '设置', itemList: [
        FLStaticItemData(
            title: '通知设置',
            accessoryType: FLStaticListCellAccessoryType.accDetail,
            cellColor: isDarkMode ? bgColor : Colors.white,
            accessoryString: '通知全部',
            onTap: handleTap),
        FLStaticItemData(
          title: '护眼模式',
          accessoryType: FLStaticListCellAccessoryType.accSwitch,
          cellColor: isDarkMode ? bgColor : Colors.white,
          onChanged: onChanged,
          accItemValue: _switchValue,
        ),
        FLStaticItemData(
          title: '自动清除缓存',
          subtitle: '每10天清理一次',
          accessoryType: FLStaticListCellAccessoryType.accCheckmark,
          cellColor: isDarkMode ? bgColor : Colors.white,
          onTap: handleTap,
          selected: true,
        )
      ]),
      FLStaticSectionData(itemList: [
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '保存',
            buttonTitleColor: Colors.blue,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onButtonPressed: () {
              print('button pressed');
            }),
        FLStaticItemData(
            cellType: FLStaticListCellType.button,
            buttonTitle: '退出登录',
            buttonTitleColor: Colors.red,
            cellColor: isDarkMode ? bgColor : Colors.white,
            onButtonPressed: () {
              print('button pressed');
            })
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFFCFCFC),
            child: FLStaticListView(
              shrinkWrap: true,
              sections: _buildList(),
            )));
  }
}
