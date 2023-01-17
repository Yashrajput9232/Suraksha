import 'package:flutter/material.dart';
import 'package:suraksha/Oncard3.dart';
import 'OnCard1.dart' as card1;
import 'OnCard3.dart' as card3;

class OnCard2 extends StatefulWidget {
  const OnCard2({super.key});

  @override
  State<OnCard2> createState() => _OnCard2State();
}

class _OnCard2State extends State<OnCard2> {
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
                  child: Image.asset('assets/images/family1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Being Safe',
                    style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'Sacramento',
                        fontSize: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ',
                    style: TextStyle(
                      color: Colors.white,
                      // fontFamily: 'Sacramento',
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
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
                              builder: (context) => card3.OnCard3()),
                        );
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
