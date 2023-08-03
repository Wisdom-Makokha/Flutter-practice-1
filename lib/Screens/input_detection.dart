import 'package:flutter/material.dart';
import 'package:my_creation/Screens/counter.dart';

class MyButton extends StatelessWidget{
  const MyButton({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Tutorial home'),
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)
                => const CounterScreen()));
              },
              child: Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                    border: Border.all(
                      color: const Color.fromARGB(255,100,149,237),
                      width: 2,
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Engage with the mortals',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: null,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                          disabledForegroundColor: Colors.grey[100],
                          disabledBackgroundColor: Colors.red[100],
                          shadowColor: Colors.blue,
                          alignment: AlignmentDirectional.center,
                        ),
                        child: const Text('Screen shift\nto counter',
                        textAlign: TextAlign.center),
                      ),
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}

