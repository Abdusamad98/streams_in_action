import 'dart:async';

import 'package:flutter/material.dart';
import 'package:streams_in_action/data/stream_generator.dart';

class CounterViewModel extends ChangeNotifier {
  CounterViewModel() {
    listenName();
  }

  //
  // int counter = 0;
  // late StreamSubscription subscription;
  //
  // listenNumbers() {
  //   Stream<int> stream = StreamGenerator.getMyNumbers();
  //   subscription = stream.listen((event) {
  //     counter = event;
  //     notifyListeners();
  //   });
  // }
  //
  // pauseCounterStream() => subscription.pause();
  //
  // resumeCounterStream() => subscription.resume();
  //
  // cancelCounterStream() => subscription.cancel();



  //---------------------With Stream Controller ------------

  String name = "Empty";
  StreamController<String> streamController = StreamController<String>();

  addToStream(String name) {
    streamController.sink.add(name);
  }

  listenName() {
    Stream<String> stream = streamController.stream;
    stream.listen((event) {
      name = event;
      notifyListeners();
    });
  }
}
