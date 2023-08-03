import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget{
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar>{
  int selectedIndex = 0;
  final ScrollController  homeController = ScrollController();

  List<Widget> myStringList = [];

  Widget listViewBody(){
    return ListView.separated(
      controller: homeController,
      itemBuilder: (BuildContext context, int index){

        int modifier = 100 * (index % 5);
        return Center(
          child: Text(
            'Item $index',
            style: TextStyle(
              color: Colors.blueGrey[modifier],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index)
        => const Divider(
          thickness: 2,
          color: Colors.black,
        ),
      itemCount: 50,
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('We\'ll work it out'),
      ),
      body: listViewBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.open_in_new_rounded),
            label: 'Open Dialog',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.lightBlue[300],
        onTap: (int index){
          switch(index){
            case 0:
              if(selectedIndex == index){
                homeController.animateTo(
                  0.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              }
              break;
            case 1:
              showModal(context);
          }
          setState((){
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

void showModal(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: const Text('What\'s up'),
      actions: <TextButton>[
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
          child: const Text('Close'),
        )
      ],
    ),
  );
}