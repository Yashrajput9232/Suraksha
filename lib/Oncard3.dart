import 'package:flutter/material.dart';
import 'package:suraksha/Oncard2.dart';
import 'OnCard2.dart';
import 'OnCard1.dart';
import "LoginPage.dart";

class OnCard3 extends StatefulWidget {
  const OnCard3({super.key});

  @override
  State<OnCard3> createState() => _OnCard3State();
}

class _OnCard3State extends State<OnCard3> {
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
                  child: Image.asset('assets/images/vehicles1.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Are you Safe',
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
                        onPressed:
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        };
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
