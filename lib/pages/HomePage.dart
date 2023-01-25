import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utility classes/MenuBar.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:suraksha/utility classes/displarReadingContainer.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String message = "This is a test message!";
  List<String> recipents = ["1234567890", "5556787676"];
  bool sendNotification = false;
  double previousVelocity = 0;
  double currentVelocity = 0;
  bool isRecording = false;
  double noiseInDecibal = 0.0;
  bool isCancel = false;
  int notification = 1;
  late StreamSubscription subscription;
  late StreamSubscription userAcclometerSubscription;
  late StreamSubscription<NoiseReading> noiseSubscription;
  List<double> locationCoordinates=[0,0];
  Position? position;
  void smsPermission() async {
    await Permission.sms.isGranted.then((isAllowed) {
      if (isAllowed == false) {
        Permission.sms.request();
      }
    });
  }

  Future checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  void startAccelerometer(bool surkshaMode) {
    if (surkshaMode) {
      try {
        userAcclometerSubscription =
            userAccelerometerEvents.listen((UserAccelerometerEvent event) {
          _onAccelerate(event);
        });
      } catch (exception) {
        print(' startNoiseRecording $exception');
      }
    }
    if (surkshaMode == false) {
      userAcclometerSubscription.cancel();
      setState(() {
        previousVelocity = 0.000;
        currentVelocity = 0.000;
      });
    }
  }

  void _onAccelerate(UserAccelerometerEvent event) {
    setState(() {
      currentVelocity =
          sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
    });
  }

  bool accidentCondition(currentVelocity, previousVelocity, noiseInDecibal) {
    // print(currentVelocity);
    if ( previousVelocity- currentVelocity> 60 || noiseInDecibal > 140) {
      return true;
    }
    return false;
  }

  void Notify() async {
    if (notification == 1) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Are You oky , Please Nullify This Message',
          body:
              ' Otherwise we Will Send Accident message to Your Selected contacts',
          fullScreenIntent: true,
          roundedBigPicture: true,
          wakeUpScreen: true,
        ),
        actionButtons: <NotificationActionButton>[
          NotificationActionButton(
              key: "open", label: "open", color: Colors.red),
        ],
      );
      setState(() {
        notification++;
      });
      startStream();
    }
  }

  void startStream() {
    subscription = waitForUserResponce().asStream().listen(
      (event) {
        print('is cancle is $isCancel');
        if (isCancel) {
          print('Stram is cancel');
          subscription.cancel();
          setState(() {
            isCancel = false;
            notification = 1;
          });
        } else {
          if (event) {
           setState(() {
             notification = 1;
             _sendSMS();
             isCancel=false;
           });
          }
        }
      },
    );
  }

  Future waitForUserResponce() async {
    await Future.delayed(const Duration(seconds: 5));
    return true;
  }

  void _sendSMS() async {
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
    } on Exception catch (e) {
      print(e);
    }
    setState(() {
      locationCoordinates[0] = position!.longitude;
      locationCoordinates[1] = position!.latitude;
    });
    String message = "This message is from Surksha app Our app dectect the Accident of your friend \n Here Is The Location \n http://www.google.com/maps/place/${locationCoordinates[0]},${locationCoordinates[1]}";
    List<String> recipents = ["1234567890", "5556787676"];

    String result =
        await sendSMS(message: message, recipients: recipents, sendDirect: true)
            .catchError((onError) {
      print(onError);
    });
    print(result);
    setState(() {
      isCancel=false;
    });
  }

  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == "open") {
      setState(() {
        isCancel = true;
        notification = 1;
      });
      // print('after set state $isCancel');
    }
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.title == "Are You oky , Please Nullify This Message") {
      setState(() {
        isCancel = true;
        notification = 1;
      });
    }
  }

  final NoiseMeter _noiseMeter = NoiseMeter();
  void startNoiseRecording(bool surkshaMode) async {
    if (surkshaMode) {
      try {
        noiseSubscription = _noiseMeter.noiseStream.listen(onData);
      } catch (exception) {
        print(' startNoiseRecording $exception');
      }
    } else {
      noiseSubscription.cancel();
      setState(() {
        isRecording = false;
        noiseInDecibal = 0.0;
      });

    }
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      if (!isRecording) {
        isRecording = true;
      }
      setState(() {
        noiseInDecibal = noiseReading.maxDecibel.floorToDouble();
      });
    });
  }

  void onError(Object error) {
    print(error.toString());
    isRecording = false;
  }

  @override
  void initState() {
    smsPermission();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (x) async {
        await onActionReceivedMethod(x);
      },
      onDismissActionReceivedMethod: (x) async {
        await onDismissActionReceivedMethod(x);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      sendNotification =
          accidentCondition(currentVelocity, previousVelocity, noiseInDecibal);
      previousVelocity = currentVelocity;
      if (sendNotification) {
        setState(() {
          Notify();
          sendNotification = false;
        });
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Page'),
        ),
      ),
      drawer: NavBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DisplayReadingContainer(
                  color: Colors.white,
                  boxTitle: 'Noise',
                  readingType: noiseInDecibal.toStringAsPrecision(2)),
              DisplayReadingContainer(
                  color: Colors.white,
                  readingType: currentVelocity.toStringAsPrecision(3),
                  boxTitle: 'Accelerometer'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 25.0,
                        offset: Offset(
                          8,
                          8,
                        ),
                      ),
                    ],
                  ),
                  child: LiteRollingSwitch(
                    value: false,
                    textOn: 'On',
                    textOff: 'Off',
                    colorOn: Colors.greenAccent,
                    colorOff: Colors.redAccent,
                    iconOn: Icons.done,
                    iconOff: Icons.close_sharp,
                    textSize: 18.0,
                    onChanged: (bool position) {
                      startAccelerometer(position);
                      startNoiseRecording(position);
                      checkLocationPermission();
                    },
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                  ),
                ),
              ),
            ],
          ),
          const Text(
            ' Suraksha Mode ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
