import 'package:flutter/material.dart';
import 'Screens/hello_world.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app',

      theme: ThemeData(
        colorScheme: const ColorScheme.light(brightness: Brightness.light),
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(
          child: MyScaffold()),
    )
  );
}