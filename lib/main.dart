import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn_full/202/model_learn_view.dart';
import 'package:flutter_learn_full/202/service/service_learn_view.dart';
import 'package:flutter_learn_full/202/service/service_post_learn_view.dart';
import 'package:flutter_learn_full/202/tab_learn.dart';
import 'package:flutter_learn_full/navigation_learn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          bottomAppBarTheme: const BottomAppBarTheme(
            shape: CircularNotchedRectangle(),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: const ServiceLearn(),
    );
  }
}
