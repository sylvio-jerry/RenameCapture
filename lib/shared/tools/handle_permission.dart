
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class HandlePermission {
  static Future<bool> requestPermission(Permission permission) async {
    AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      var re = await Permission.manageExternalStorage.request();
      if (re.isGranted) {
        print('granted');
        return true;
      } else {
        print('not granted');
        return false;
      }
    } else {
      if (await permission.isGranted) {
        print('granted');
        return true;
      } else {
        var result = await permission.request();
        if (result.isGranted) {
          print('granted');
          return true;
        } else {
          print('not granted');
          return false;
        }
      }
    }
  }
}
