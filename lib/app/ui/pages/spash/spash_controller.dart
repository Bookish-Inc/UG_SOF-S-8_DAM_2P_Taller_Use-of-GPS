import 'package:flutter/widgets.dart';
import 'package:flutter_mapas/app/ui/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);
  
  Future<void> chechpermission() async {
    final isGranted = await _locationPermission.isGranted;
    if (isGranted){
      _routeName = Routes.HOME;
    }
    else{
      _routeName = Routes.PERMISSIONS;
    }

    notifyListeners();

  }
}