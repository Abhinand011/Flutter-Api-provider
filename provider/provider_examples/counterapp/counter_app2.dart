import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_classeslis.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: ( context)=>Counter(),
      child: MaterialApp(home: CounterApp(),)));
}

class CounterApp extends StatelessWidget {
   CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Counter Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 14),
            ),
            Consumer<Counter>(
                builder: (context, counter, child) {
              return Text(
                '${counter.count}',
                style: TextStyle(fontSize: 30,),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter>().increment();
                  },
                  child: Text('Increment'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Counter>().decrement();
                  },
                  child: Text('Decrement'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<Counter>().reset();
                    },
                    child: Text('Reset')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
