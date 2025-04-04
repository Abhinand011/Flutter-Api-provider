import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_classeslis.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(home: CounterScreen()),
    ),
  );
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Count: ${counter.count}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counter.increment();
              },
              child: const Text('Increment'),
            ), ElevatedButton(
              onPressed: () {
                counter.decrement();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
