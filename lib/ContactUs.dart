import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
  ),
            backgroundColor: Color.fromARGB(255, 92, 71, 224),
            title: Center(child: Text('Contact Us        '))),
          backgroundColor: Color.fromARGB(255, 27, 107, 172),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(5, 60, 5, 5),
            child: ContactUs(
              companyColor: Color.fromARGB(255, 255, 255, 255),
              taglineColor: Color.fromARGB(255, 255, 255, 255),
              cardColor: Color.fromARGB(255, 234, 236, 235),
              textColor: Color.fromARGB(255, 0, 0, 0),
              logo: AssetImage('assets/images/logo.jpg'),
              email: 'yashrajput9232@gmail.com',
              companyName: 'Short Circuits',
              phoneNumber: '+91 9175034021',
              dividerThickness: 2,
              githubUserName: 'yashrajput9232',
              linkedinURL: 'https://www.linkedin.com/in/yash-rajput-6881591ab/',
              tagLine: 'Suraksha Developer',
              instagram: 'yashrajput9232',
            ),
          ),
        ),
      ),
    );
  }
}
