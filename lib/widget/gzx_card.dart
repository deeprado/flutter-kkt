import 'package:flutter/material.dart';

class UnderPicturesOnTextButtonModel {
  final String imageName;
  final String title;
  final double width;
  final double height;

  UnderPicturesOnTextButtonModel(
      this.imageName, this.title, this.width, this.height);
}

class GZXCard extends StatelessWidget {
  final Widget child;
  final Color color;
  final String leftTopTitle;
  final String leftTopTitleLeftImageName;

//  final String leftTopTitleLeftImageName;
  final String rightTopTitle;
  final int crossAxisCount;
  final List<UnderPicturesOnTextButtonModel> underPicturesOnTextButtonModel;
  final bool isShowTitleBar;
  final bool isShowRightTopWidget;
  final Widget leftTopWidget;

//  final Widget contentWidget;
  final double contentPaddingTop;
  final double contentPaddingBottom;
  final List<Widget> customChildren;
  final double childAspectRatio;
  final TextStyle buttonTextStyle;

  const GZXCard({
    Key key,
    this.child,
    @required this.color,
    this.leftTopTitle,
    this.rightTopTitle,
    this.underPicturesOnTextButtonModel,
    @required this.crossAxisCount,
    this.isShowTitleBar = true,
    this.isShowRightTopWidget = true,
    this.leftTopWidget,
//    this.contentWidget,
    this.contentPaddingTop = 16,
    this.contentPaddingBottom = 12,
    this.customChildren,
    this.childAspectRatio = 7 / 6,
    this.leftTopTitleLeftImageName,
    this.buttonTextStyle = const TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black54,
      fontSize: 14,
      decoration: TextDecoration.none,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(leftTopTitleLeftImageName);
    var card = Container(
        color: color,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//              padding: EdgeInsets.only(top: 20,bottom: 20),
//        alignment: Alignment.center,
        child: Container(
//          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white,
          ),
          child: Container(
//            height: 50,
            padding: EdgeInsets.only(top: 10, bottom: contentPaddingBottom),
            child: Column(
              children: <Widget>[
//                SizedBox(
//                  height: 10,
//                ),
                !isShowTitleBar
                    ? Container()
                    : Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              leftTopTitleLeftImageName == null
                                  ? Container()
                                  : Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/images/$leftTopTitleLeftImageName.png",
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        )
                                      ],
                                    ),
                              leftTopWidget == null
                                  ? Expanded(
                                      child: Text(
                                        '$leftTopTitle',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    )
                                  : leftTopWidget,
                              !isShowRightTopWidget
                                  ? Container()
                                  : Row(
                                      children: <Widget>[
                                        Text(
                                          '$rightTopTitle',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13,
                                            color: Color(0xFF999999),
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 15,
                                          color: Color(0xFF999999),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            height: 1,
                            color: Color(0xFFeeede6),
                          ),
                          SizedBox(
                            height: contentPaddingTop,
                          ),
                        ],
                      ),
                customChildren == null
                    ? Container(
                        child: GridView.count(
//                    childAspectRatio: (ScreenUtil.screenWidth-12*2)/crossAxisCount,
                          childAspectRatio: childAspectRatio,
                          primary: false,
                          shrinkWrap: true,
                          crossAxisCount: crossAxisCount,
                          children: underPicturesOnTextButtonModel
                              .map<Widget>((item) {
                            return Container(
                              child: _underPicturesOnText(item.imageName,
                                  item.width, item.height, item.title),
                            );
                          }).toList(),
                        ),
                      )
                    : Container(
                        child: GridView.count(
//                    childAspectRatio: (ScreenUtil.screenWidth-12*2)/crossAxisCount,
                        childAspectRatio: childAspectRatio,
                        primary: false,
                        shrinkWrap: true,
                        crossAxisCount: crossAxisCount,
                        children: customChildren,
                      )),
              ],
            ),
          ),
        ));

    return card;
  }

  _underPicturesOnText(imageName, imageWidth, imageHeight, title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          "assets/images/$imageName.png",
          height: imageHeight,
          width: imageWidth,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title ??= imageName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // style: buttonTextStyle,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black54,
            fontSize: 14,
            decoration: TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
