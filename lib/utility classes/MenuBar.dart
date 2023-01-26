import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:suraksha/pages/GuardianDetailPage.dart';
import 'package:suraksha/pages/PolicyPage.dart';
import 'package:suraksha/pages/login.dart';
import 'package:suraksha/Constant/Constant.dart';
import '../pages/ContactUs.dart';

class NavBar extends StatelessWidget {
  String image =
      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
 UserAccountsDrawerHeader(
            accountName: Text((_auth.currentUser!.displayName == null || _auth.currentUser!.displayName!.isEmpty)  ? "User" : _auth.currentUser!.displayName!),
            accountEmail: Text(_auth.currentUser!.email!),
            decoration:  BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                   (_auth.currentUser!.photoURL== null || _auth.currentUser!.photoURL!.isEmpty) ? 'https://t4.ftcdn.net/jpg/04/13/42/61/360_F_413426103_zBEu5NRrZHkiNcgiHeJAqcOQsmsdEMy3.jpg' :  _auth.currentUser!.photoURL!),
              ),
            ),
          ),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyLogin(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
