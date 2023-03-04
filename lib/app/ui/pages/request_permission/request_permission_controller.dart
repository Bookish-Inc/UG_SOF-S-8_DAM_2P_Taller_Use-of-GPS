import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionController{
  final Permission _locationPermission;
  RequestPermissionController(this._locationPermission);

  final _streamController = StreamController<PermissionStatus>.broadcast();
  Stream<PermissionStatus> get onStatusChange => _streamController.stream;

  late bool _gpsEnabled;
  bool get gpsEnabled => _gpsEnabled;

  request() async{
    final status = await _locationPermission.request();
    _notify(status);   
    _checkGPS();
  }

  void _notify(PermissionStatus status){
    if (_streamController.hasListener){
      _streamController.sink.add(status);
    }
  }

  void dispose(){
    _streamController.close();
  }

  Future<void> _checkGPS() async{
      _gpsEnabled =  await Geolocator.isLocationServiceEnabled();
    }
}