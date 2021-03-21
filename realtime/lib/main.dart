import 'package:flutter/material.dart';
import 'package:realtime/pages/home/home_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget),
            defaultScale: true,
            minWidth: 450,
            defaultName: MOBILE,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE)
            ]
        );
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}