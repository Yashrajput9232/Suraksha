//import 'package:email_otp/email_otp.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:suraksha/Constant/Constant.dart';
import 'ResetPassword.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  EmailOTP myauth = EmailOTP();

  //EmailOTP emailAuth = new EmailOTP(sessionName : "Test Session");

  // void sendOTP() async {

  //   var res = await emailAuth.sendOtp(recipientMail: _emailController.text);
  //   if (res) {
  //     print("OTP Sent");
  //   } else {
  //     print("We could not sent the OTP");
  //   }
  // }

  // void verifyOTP() async {
  //   var res = emailAuth.validateOtp(
  //       recipientMail: _emailController.text, userOtp: _otpController.text);
  //   if (res) {
  //     print("OTP Verified");
  //   } else {
  //     print("Invalid OTP");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fp.png'), fit: BoxFit.cover),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(left: 35, top: 30),
                child: Text(
                  'Email\nVerification',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 225, right: 25),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",
                          suffixIcon: TextButton(
                            child: Text("Send OTP"),
                            onPressed: () async {
                              myauth.setConfig(
                                  appEmail: "sejalbarai8@gmail.com",
                                  appName: "Email OTP",
                                  userEmail: _emailController.text,
                                  otpLength: 6,
                                  otpType: OTPType.digitsOnly);
                              if (await myauth.sendOTP() == true) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("OTP has been sent"),
                                ));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Oops, OTP send failed"),
                                ));
                              }
                            },
                          )),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextField(
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter OTP",
                        labelText: "OTP",
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ElevatedButton(
                      child: Text("Verify OTP"),
                      onPressed: () {
                        push_screen(context: context, widget: ResetPassword());
                      },
                    )
                  ],
                ),
              )
            ])));
  }
}
