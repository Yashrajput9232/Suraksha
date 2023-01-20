import 'package:flutter/material.dart';
import 'MenuBar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Home Page       ')),),
      drawer: NavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: LiteRollingSwitch(
                  value: true,
                  textOn: 'On',
                  textOff: 'Off',
                  colorOn: Colors.greenAccent,
                  colorOff: Colors.redAccent,
                  iconOn: Icons.done,
                  iconOff: Icons.close_sharp,
                  textSize: 18.0,
                  onChanged: (bool position) {
                    print('The Button is $position');
                  },
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                ),
              ),
            ],
          ),
          Text(' Suraksha Mode ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500 ),)
        ],
      ),
      
    );
  }
}