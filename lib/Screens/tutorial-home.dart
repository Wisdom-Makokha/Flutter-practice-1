import 'package:flutter/material.dart';
import 'package:my_creation/Screens/input-detection.dart';

class TutorialHome extends StatelessWidget{
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Tutorial title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          ),
        ],
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          => const MyButton()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}