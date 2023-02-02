// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:suraksha/Auth.dart';
import 'package:suraksha/Constant/Constant.dart';
import 'package:suraksha/pages/GuardianPage1.dart';
import 'package:suraksha/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController emailController = TextEditingController(text: "tush1245@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "11tusmli89");
  final AuthService _auth = AuthService();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  String email = ' ';
  String password = ' ';
  String error = ' ';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 30),
                child: const Text(
                  'Create\nAccount',
                  style: TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w300),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter a name' : null,
                              style: const TextStyle(),
                              decoration: InputDecoration(
                                  fillColor:
                                      Color.fromARGB(75, 255, 255, 255),
                                  filled: true,
                                  hintText: "Name",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),

                            //Gap

                            const SizedBox(
                              height: 30,
                            ),

                            //Enter your Email
                            TextFormField(
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              controller: emailController,
                              style: const TextStyle(),
                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(75, 255, 255, 255),
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),

                            //Gap
                            const SizedBox(
                              height: 30,
                            ),
                            //Enter Password
                            TextFormField(
                              validator: (val) => val!.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                              controller: passwordController,
                              style: const TextStyle(),
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor:
                                      const Color.fromARGB(75, 255, 255, 255),
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            //gap

                            const SizedBox(
                              height: 40,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w400),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          FirebaseAuth.instance
                                              .createUserWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text)
                                              .then((value) {
                                                  setState(() {
                                              isLoading = false;
                                            });
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  "Account Created Successfully!"),
                                            ));

                                            push_screen(
                                                context: context,
                                                widget: const GuardianPage1());
                                          }).onError((error, stackTrace) {
                                            print("Error ${error.toString()}");
                                              setState(() {
                                              isLoading = false;
                                            });
                                          });
                                        }
                                      },
                                      icon: isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 1.5,
                                              ),
                                            )
                                          : const Icon(
                                              Icons.arrow_forward,
                                            )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     TextButton(
                            //       onPressed: () {},
                            //       style: const ButtonStyle(),
                            //       child: const Text(
                            //         'Sign In',
                            //         textAlign: TextAlign.left,
                            //         style: TextStyle(
                            //             decoration: TextDecoration.underline,
                            //             color: Colors.white,
                            //             fontSize: 18),
                            //       ),
                            //     ),
                            //   ],
                            // )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
