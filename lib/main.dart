import 'package:flutter/material.dart';
import 'package:flutter_mapas/app/ui/routes/pages.dart';

import 'app/ui/pages/home/home_page.dart';
import 'app/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.SPLASH,
      routes: appRoutes(),
      //home: HomePage(),
    );
  }
}
