import 'dart:io' show Platform;

class Secret {
  static const ANDROID_CLIENT_ID = "519615782292-fgds9shbntom16i56uko00bm6b15l4bu.apps.googleusercontent.com";
  //static const IOS_CLIENT_ID = "519615782292-lptejc3jjo1u472vv0tmtm20ms96nvl7.apps.googleusercontent.com";
  static String getId() => Platform.isAndroid ? Secret.ANDROID_CLIENT_ID : '';
}