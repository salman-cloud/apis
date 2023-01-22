import 'package:flutter/material.dart';
import 'package:untitled/screens/api2.dart';
import 'package:untitled/screens/api3_complex.dart';
import 'package:untitled/screens/example4.dart';
import 'package:untitled/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ExampleFour(),
    );
  }
}


