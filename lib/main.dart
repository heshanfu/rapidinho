import 'package:flutter/material.dart';
import 'package:rapidinho/home_page.dart';

void main() => runApp(
  RapidinhoApp()
);

class RapidinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rapidinho',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
