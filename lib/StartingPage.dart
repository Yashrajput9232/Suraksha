import 'package:flutter/material.dart';
import 'OnCard1.dart' as card1;
import 'OnCard2.dart' as card2;
import 'OnCard3.dart' as card3;
import 'Constant.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 92, 71, 224),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/start1.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Suraksha',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
padding: const EdgeInsets.only(top: 35.0),
            child: ElevatedButton(
              child: Text('Get Started!', style: TextStyle(color: Colors.black)),
              onPressed: () {
                push_screen(context: context, widget: card1.OnCard1());
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize: 18))),
            ),
          ),
        ],
      ),
    );
  }
}
