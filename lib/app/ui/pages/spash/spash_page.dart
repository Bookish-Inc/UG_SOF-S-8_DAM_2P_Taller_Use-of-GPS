import 'package:flutter/material.dart';
import 'package:flutter_mapas/app/ui/pages/spash/spash_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class SpashPage extends StatefulWidget {
  const SpashPage({Key? key}) : super(key: key);

  @override
  State<SpashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SpashPage> {

  final _controller = SplashController(Permission.locationWhenInUse);

  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_){ 
        _controller.chechpermission();
      });
    _controller.addListener(() { 
      if (_controller.routeName != null){
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}