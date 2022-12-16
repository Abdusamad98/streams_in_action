import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:streams_in_action/data/stream_generator.dart';
import 'package:streams_in_action/view_models/counter_view_model.dart';

class CounterScreenView extends StatefulWidget {
  const CounterScreenView({Key? key}) : super(key: key);

  @override
  State<CounterScreenView> createState() => _CounterScreenViewState();
}

class _CounterScreenViewState extends State<CounterScreenView> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CounterViewModel(),
        builder: (context, child) {
          return Consumer<CounterViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  Center(child: Text("Name:${viewModel.name}")),
                  Padding(
                      padding: EdgeInsets.all(32),
                      child: TextField(
                        controller: nameController,
                        onChanged: (value) {
                          context.read<CounterViewModel>().addToStream(value);
                        },
                      )),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<CounterViewModel>()
                            .addToStream(nameController.text);
                      },
                      child: Text("Add name")),
                ],
              );
            },
          );
        },
        // child: Text(Provider.of<CounterViewModel>(context).counter.toString()),
      ),
    );
  }
}

// Scaffold(
// appBar: AppBar(
// title: Text("Counter Screen"),
// ),
// body: ChangeNotifierProvider(
// create: (context) => CounterViewModel(),
// builder: (context, child) {
// return Consumer<CounterViewModel>(
// builder: (context, viewModel, child) {
// return Column(
// children: [
// Center(child: Text(viewModel.counter.toString())),
// ElevatedButton(onPressed: () {
// context.read<CounterViewModel>().pauseCounterStream();
// }, child: Text("Pause Stream")),
// ElevatedButton(
// onPressed: () {
// context.read<CounterViewModel>().resumeCounterStream();
// }, child: Text("Resume Stream")),
// ElevatedButton(
// onPressed: () {
// context.read<CounterViewModel>().cancelCounterStream();
// }, child: Text("Cancel Stream")),
// ],
// );
// },
// );
// },
// // child: Text(Provider.of<CounterViewModel>(context).counter.toString()),
// ),
// );
