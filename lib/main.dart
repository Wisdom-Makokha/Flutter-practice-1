import 'package:flutter/material.dart';
import 'Screens/hello-world.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
          child: MyScaffold()),
    )
  );
}