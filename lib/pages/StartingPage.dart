import 'package:flutter/material.dart';
import 'package:suraksha/utility classes/Oncard1.dart' as card1;
import 'package:suraksha/Constant/Constant.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 92, 71, 224),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/start1.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
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
              onPressed: () {
                push_screen(
                  context: context,
                  widget: const card1.OnCard1(),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 255, 255),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(12),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 18),
                ),
              ),
              child: const Text(
                'Get Started!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
