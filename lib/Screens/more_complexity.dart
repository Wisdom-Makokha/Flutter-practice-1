import 'package:flutter/material.dart';
import 'package:my_creation/Screens/long_press_functionality.dart';

class CounterDisplay extends StatelessWidget{
  const CounterDisplay({required this.count, super.key});

  final int count;
  @override
  Widget build(BuildContext context){
    return Text('Count: $count');
  }
}

class CounterIncrement extends StatelessWidget{
  const CounterIncrement({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Increment'),
    );
  }
}

class CounterDecrement extends StatelessWidget{
  const CounterDecrement({required this.onPressed, super.key});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Decrement'),
    );
  }
}

class Counter extends StatefulWidget{
  const Counter({super.key});

  @override
  State<Counter> createState()=> CounterState();
}

class CounterState extends State<Counter>{
  int myCounter = 0;

  void increment(){
    setState((){
      myCounter++;
    });
  }

  void decrement(){
    setState((){
      myCounter--;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter 2.0'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterIncrement(onPressed: increment),
            const SizedBox(width: 16),
            CounterDecrement(onPressed: decrement),
            const SizedBox(width: 16),
            CounterDisplay(count: myCounter),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          => const LongScreen()));
        },
        child: const Icon(Icons.arrow_circle_right),
      )
    );
  }
}