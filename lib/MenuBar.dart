import 'package:flutter/material.dart';
import 'package:suraksha/PolicyPage.dart';
import 'package:suraksha/login.dart';
import 'Constant.dart';
import 'ContactUs.dart';

class NavBar extends StatelessWidget {
  String image =
      'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Yash Rajput'),
            accountEmail: Text('yashrajput9232@gmail.com'),
            // currentAccountPicture: CircleAvatar(
            //   child: ClipOval(
            //     child: Image.network(
            //       "https://images.unsplash.com/photo-1583864697784-a0efc8379f70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bWFsZSUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80",
            //       fit: BoxFit.cover,
            //       width: 90,
            //       height: 90,
            //     ),
            //   ),
            // ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://t4.ftcdn.net/jpg/04/13/42/61/360_F_413426103_zBEu5NRrZHkiNcgiHeJAqcOQsmsdEMy3.jpg')),
            ),
          ),
         
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Contact Us'),
            onTap: () {
              push_screen(context: context, widget: MyApp());
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PolicyPage()),
              );
            },
          ),
          Divider(),
          ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyLogin()),
                );
              }),
        ],
      ),
    );
  }
}
