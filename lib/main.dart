import 'package:flutter/material.dart';
import 'package:prueba/pages/first_page.dart';
import 'package:prueba/pages/people_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/'       : ( BuildContext context ) =>   FirstPage(),
        'detalle' : ( BuildContext context ) =>   PeopleDetails(),
      },
    );
  }
}

