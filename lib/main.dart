// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suraksha/pages/ForgetPassword.dart';
import 'package:suraksha/pages/PolicyPage.dart';
import 'package:suraksha/pages/ResetPassword.dart';
import 'package:suraksha/pages/login.dart';
import 'package:suraksha/pages/HomePage.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          importance: NotificationImportance.High,
          channelShowBadge: true,
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'basic_channel',
          channelDescription: 'Notification channel for basic tests',
          ledColor: Colors.white,
        )
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  runApp(const Suraksha());
}

class Suraksha extends StatefulWidget {
  const Suraksha({super.key});

  @override
  State<Suraksha> createState() => _SurakshaState();
}

class _SurakshaState extends State<Suraksha> {
  Widget home = const Scaffold();

  void switchHome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? email = pref.getString("email");
    if (email == null) {
      setState(() {
        home = const MyLogin();
      });
    } else {
      setState(() {
        home = const HomePage();
      });
    }
  }

  @override
  void initState() {
    switchHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: HomePage()),
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
