import 'package:flutter/material.dart';
import 'package:streams_in_action/ui/counter_screen.dart';
import 'package:streams_in_action/ui/counter_screen_view.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreenView(),

    );
  }
}


