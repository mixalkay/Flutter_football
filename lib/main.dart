import 'package:flutter/material.dart';
import 'package:footballapp/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {




    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
