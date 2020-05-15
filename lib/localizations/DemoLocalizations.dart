import 'package:flutter/material.dart';

class DemoLocalizations {
  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app name': 'KKT',
      'create exam': 'Create Exam',
      'task title': 'Flutter Demo',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the button this many times:',
      'inc': 'Increment'
    },
    'zh': {
      'app name': '快考题',
      'create exam': '创建考试',
      'task title': 'Flutter 示例',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc': '增加'
    }
  };

  get appName {
    return _localizedValues[locale.languageCode]['app name'];
  }

  get createExam {
    return _localizedValues[locale.languageCode]['create exam'];
  }

  get taskTitle {
    return _localizedValues[locale.languageCode]['task title'];
  }

  get titleBarTitle {
    return _localizedValues[locale.languageCode]['titlebar title'];
  }

  get clickTop {
    return _localizedValues[locale.languageCode]['click tip'];
  }

  get inc {
    return _localizedValues[locale.languageCode]['inc'];
  }

  // 此处
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of(context, DemoLocalizations);
  }
}
