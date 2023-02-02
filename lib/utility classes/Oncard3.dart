import 'package:flutter/material.dart';
import 'package:suraksha/pages/register.dart';
import 'package:suraksha/Constant/Constant.dart';



class OnCard3 extends StatefulWidget {
  const OnCard3({super.key});

  @override
  State<OnCard3> createState() => _OnCard3State();
}

class _OnCard3State extends State<OnCard3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 92, 71, 224),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Image.asset('assets/images/vehicles1.png'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Text(
                    'Stay Protected',
                    style: TextStyle(
                        color: Colors.white,
                        // fontFamily: 'Sacramento',
                        fontSize: 50),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25.0),
                    child: Text(
                      'This app is designed to provide you with the necessary tools and resources to ensure your protection and safety ',
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
                              const Color.fromARGB(255, 255, 255, 255)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: const BorderSide(color: Colors.black)))),
                      onPressed: () {
                        onPressed:
                        () {
                          push_screen(context: context, widget: const MyRegister());
                        };
                      },
                      child: const Text(
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
