import 'package:flutter/material.dart';
import 'package:streams_in_action/data/stream_generator.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: StreamBuilder<int>(
        stream: StreamGenerator.getMyNumbers(),
        builder: (context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data!.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
