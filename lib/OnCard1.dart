import 'package:flutter/material.dart';
import 'package:suraksha/Oncard2.dart';
import 'OnCard2.dart' as card2;
import 'OnCard3.dart';

class OnCard1 extends StatefulWidget {
  const OnCard1({super.key});

  @override
  State<OnCard1> createState() => _OnCard1State();
}

class _OnCard1State extends State<OnCard1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 92, 71, 224),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Image.asset('assets/images/car1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Stay Safe',
                    style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'Sacramento',
                        fontSize: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Text(
                      'Staying safe while driving involves following traffic laws and being aware of your surroundings at all times.',
                      style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'Sacramento',
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 255, 255, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.black)))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => card2.OnCard2())));
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 18, color: Color.fromARGB(255, 2, 2, 2)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
