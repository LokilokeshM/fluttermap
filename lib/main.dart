import 'package:flutter/material.dart';
import 'package:map_demo/NewMapDemo/HomeScreen.dart';

import 'package:provider/provider.dart';

import 'Screen/Src/Home.dart';
import 'Screen/blocs/application_blocs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity),
          home: HomePage()),
    );
  }
}
