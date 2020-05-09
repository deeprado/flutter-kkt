import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信分享'),
      ),
      body: Center(
        child: new ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareText");
                  },
                  child: const Text("share text")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareImage");
                  },
                  child: const Text("share image")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareWebPage");
                  },
                  child: const Text("share webpage")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareMusic");
                  },
                  child: const Text("share music")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareVideo");
                  },
                  child: const Text("share video")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/shareMiniProgram");
                  },
                  child: const Text("share mini program")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/sendAuth");
                  },
                  child: const Text("send auth")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/pay");
                  },
                  child: const Text("pay")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/launchMiniProgram");
                  },
                  child: const Text("Launch MiniProgram")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/subscribeMessage");
                  },
                  child: const Text("SubscribeMessage")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/AuthByQRCode");
                  },
                  child: const Text("AuthByQRCode")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/fluwx/AutoDeduct");
                  },
                  child: const Text("SignAuto-deduct")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new OutlineButton(
                  onPressed: () {
                    openWeChatApp();
                  },
                  child: const Text("Open WeChat App")),
            ),
          ],
        ),
      ),
    );
  }
}
