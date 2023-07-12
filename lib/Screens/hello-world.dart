import 'package:flutter/material.dart';
import 'package:my_creation/Screens/tutorial-home.dart';
import '../Globals/appbar.dart';

class MyScaffold extends StatelessWidget{
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context){
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text('Example title',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello world!'),
            ),
          ),
          ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => const TutorialHome()));
            },
            child: const Text('Tutorial home'),
          ),
        ],
      ),
    );
  }
}