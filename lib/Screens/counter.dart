import 'package:flutter/material.dart';
import 'package:my_creation/Screens/more_complexity.dart';

class CounterScreen extends StatefulWidget{
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState()=> CounterScreenState();
}

class CounterScreenState extends State<CounterScreen>{
  int counter = 0;

  void increment(){
    setState((){
      counter++;
    });
  }

  void decrement(){
    setState((){
      counter--;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The counter: $counter',
              style:const  TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  onPressed: (counter < 20) ? increment : null,
                  backgroundColor: Colors.blueGrey,
                  label: const Text('Add'),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(
                  width: 16,
                ),
                FloatingActionButton.extended(
                  onPressed: (counter > 0) ? decrement : null,
                  backgroundColor: Colors.blueGrey,
                  heroTag: null,
                  label: const Text('Subtract'),
                  icon: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => const Counter()));
              },
              child: const Text('Screen shift to Counter 2'),
            )
          ],
        ),
      ),
    );
  }
}