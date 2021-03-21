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

    DateTime currently = DateTime.now();

    return MaterialApp(
      title: 'Real Time',
      theme: ThemeData(
        primaryColor: currently.hour >= 06 && currently.hour <= 17 ? Colors.white : Colors.black,
      ),
      builder: (context, widget) {
        return ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget),
            defaultScale: true,
            minWidth: 450,
            defaultName: MOBILE,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.resize(800, name: TABLET),
            ]
        );
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}