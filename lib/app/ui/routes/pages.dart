import 'package:flutter/widgets.dart';
import 'package:flutter_mapas/app/ui/pages/home/home_page.dart';
import 'package:flutter_mapas/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:flutter_mapas/app/ui/pages/spash/spash_page.dart';
import 'package:flutter_mapas/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_)=> const SpashPage(),
    Routes.PERMISSIONS:(_) => const RequestPermissionPage(),
    Routes.HOME:(_) => const HomePage(),
  };
}