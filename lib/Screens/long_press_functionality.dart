import 'package:flutter/material.dart';
import 'package:my_creation/Screens/bottom_long.dart';

class TapOrHoldButton extends StatefulWidget{
  final VoidCallback onUpdate;
  final int minDelay;
  final int initialDelay;
  final int delaySteps;
  final IconData myIcon;

  const TapOrHoldButton({
    Key? key,
    required this.onUpdate,
    this.minDelay = 100,
    this.initialDelay = 300,
    this.delaySteps = 10,
    required this.myIcon
}) : assert(minDelay <= initialDelay, "The minimum delay cannot be larger than"
      "the initial delay"), super(key: key);

  @override
  State<TapOrHoldButton> createState()=> TapOrHoldButtonState();
}

class TapOrHoldButtonState extends State<TapOrHoldButton>{
  bool holding = false;
  int tapDownCount = 0;

  @override
  Widget build(BuildContext context){
    var shape = const CircleBorder();
    return Material(
      color: Theme.of(context).indicatorColor,
      shape: shape,
      child: InkWell(
        onTap: () => stopHolding(),
        onTapDown: (_) => startHolding(),
        onTapCancel: () => stopHolding(),
        customBorder: shape,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            widget.myIcon,
            color: Theme.of(context).textTheme.displayLarge?.color ?? Colors.white70,
            size: 36,
          ),
        ),
      ),
    );
  }

  void startHolding()async{
    widget.onUpdate();
    tapDownCount += 1;
    final int myCount = tapDownCount;
    if(holding) return;
    holding = true;

    final step = (widget.initialDelay - widget.minDelay).toDouble()
        / widget.delaySteps;
    var delay = widget.initialDelay.toDouble();

    while(true){
      await Future.delayed(Duration(milliseconds: delay.round()));
      if(holding && myCount == tapDownCount){
        widget.onUpdate();
      } else {
        return;
      }

      if(delay > widget.minDelay) delay -= step;
    }
  }
  void stopHolding(){
    holding = false;
  }
}

class LongScreen extends StatefulWidget{
  const LongScreen({super.key});

  @override
  State<LongScreen> createState()=> LongScreenState();
}

class LongScreenState extends State<LongScreen>{
  int counter = 0;

  void increaseCounter(){
    setState((){
      counter++;
    });
  }

  void decreaseCounter(){
    setState((){
      counter--;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Long Press'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 8,
          ),
          height: 400,
          decoration: BoxDecoration(
            color: Colors.lightBlue[50],
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TapOrHoldButton(
                      onUpdate: increaseCounter,
                      myIcon: Icons.add
                  ),
                  const SizedBox(width: 20,),
                  TapOrHoldButton(
                      onUpdate: decreaseCounter,
                      myIcon: Icons.remove
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          =>  const BottomNavBar()));
        },
        child: const Icon(Icons.arrow_circle_right),
      )
    );
  }
}