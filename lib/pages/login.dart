import 'package:flutter/material.dart';
import 'package:suraksha/Auth.dart';
import 'package:suraksha/Constant/Constant.dart';
import 'package:suraksha/pages/ForgetPassword.dart';
import 'package:suraksha/pages/HomePage.dart';
import 'package:suraksha/pages/register.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final formKey = GlobalKey<FormState>();
   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  
  
  String email = ' ';
  String password = ' ';
  String error = ' ';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kloginPageContainerStyle,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
              key: formKey,
          child: Stack(
            children: [
              Container(),
              Container(
                padding: const EdgeInsets.only(left: 35, top: 130),
                child: const Text(
                  'Welcome\nBack',
                  style: kWelcomeBackTextStyle,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextFormField(

                               validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                              controller: emailController,

                              style: const TextStyle(color: kFieldTextColor),
                              decoration: InputDecoration(
                                  fillColor: kFieldFillColor,
                                  filled: true,
                                  hintText: "Email",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
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
                                      const Color.fromARGB(120, 255, 255, 255),
                                  filled: true,
                                  hintText: "Password",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.w700),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: const Color(0xff4c505b),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        
                                          if (formKey.currentState!.validate()) {
                                          FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text)
                                              .then((value) {
                                            print("the value is $value");

                                           push_screen(
                                        context: context,
                                        widget: const HomePage());
                                          }).onError((error, stackTrace) {
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Invalid Credentials"),
                                      ));
                                          });
                                        }
                                          
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward,
                                      )),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    push_screen(
                                        context: context,
                                        widget: const MyRegister());
                                  },
                                  style: const ButtonStyle(),
                                  child: const Text(
                                    'Sign Up',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18),
                                  ),
                                ),
                                TextButton(
                                    onPressed: () {
                                      push_screen(
                                          context: context,
                                          widget: const EmailVerification());
                                    },
                                    child: const Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18,
                                      ),
                                    )),
                              ],
                            )
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
