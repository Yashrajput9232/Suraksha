// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraksha/pages/GuardianDetailPage.dart';
import 'package:suraksha/pages/PolicyPage.dart';
import 'package:suraksha/pages/login.dart';
import 'package:suraksha/Constant/Constant.dart';
import '../pages/ContactUs.dart';

class NavBar extends StatelessWidget {
  String image =
      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text((_auth.currentUser!.displayName == null ||
                    _auth.currentUser!.displayName!.isEmpty)
                ? "User"
                : _auth.currentUser!.displayName!),
            accountEmail: Text((_auth.currentUser!.email == null ||
                    _auth.currentUser!.email!.isEmpty)?"suraksha>gmail.com":_auth.currentUser!.email!),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/1.jpg')
              ),
            ),
          ),
           // Container(
           //   height: 150,
           //   color: Colors.purpleAccent,
           //   child: Image(
           //     image: AssetImage('assets/images/1.jpg',),
           //     fit: BoxFit.cover,
           //   ),
           // ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: const Text('Contact Us'),
            onTap: () {
              push_screen(
                context: context,
                widget: MyApp(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Guardian Details'),
            onTap: () {
              push_screen(
                context: context,
                widget: const GuardianDetailPage(),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: const Text('Policy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PolicyPage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
              title: const Text('Exit'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear().then((value) {
                  if (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLogin(),
                      ),
                    );
                  }
                });
              }),
        ],
      ),
    );
  }
}
