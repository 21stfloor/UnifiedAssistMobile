import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unified_assist/pages/s_o_spage/s_o_spage_widget.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:unified_assist/pages/sms_functions.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:vibration/vibration.dart';
import '../auth/firebase_auth/auth_util.dart';
import '../main.dart';


class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {

  static const _volumeBtnChannel = MethodChannel("mychannel");
  int pressCount = 0;
  final audioPlayer = AudioPlayer();
  Timer? timer;
  late Future<SharedPreferences> preferences;
  bool alarmState = false;
  static const platform = MethodChannel('com.thesis.unifiedassist/startService');
  static const MethodChannel _channelSOS = MethodChannel('com.thesis.unifiedassist/sendSOS');

  late FirebaseFirestore db;

  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>> listener;

  @override
  void initState() {
    super.initState();
    setState(() {
      pressCount = 0;
      preferences = SharedPreferences.getInstance();
    });

    _startService();
    initializeVolumeListener();
    listenToSOS();
  }

  Future<void> listenToSOS() async {
    var initState = true;
    var contacts = await getContacts();
    db = FirebaseFirestore.instance;
    try {
      final collection = db
          .collection("SOS")
          .where("caller", whereIn: contacts);

      listener = collection.snapshots()
          .listen((event) async {

        if (initState) {
          initState = false;
        } else {

          for (var change in event.docChanges) {
              if (change.type != DocumentChangeType.added) return;
              var data = change.doc.data();
              print("SOS detected! : $data");
              showNotification(data?["callerName"]);
              if(!await hasVibrationSupport()) return;
              Vibration.vibrate(duration: 5000);
          }
        }
      });
    }
    catch(error){
      print(error);
    }
  }

  Future<bool> hasVibrationSupport() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    return (hasVibrator != null && hasVibrator);
  }


  Future<void> showNotification(String callerName) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel_id', // channel ID
      'channel_name', // channel name
      channelDescription: 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Emergency SOS', // Notification title
      '${callerName} is having an emergency!', // Notification body
      notificationDetails,
    );
  }

  Future<void> _startService() async {
    try {
      await platform.invokeMethod('startVolumeButtonService');
    } on PlatformException catch (e) {
      print("Failed to start service: '${e.message}'.");
    }
  }


  initializeVolumeListener() async {
    final SharedPreferences prefs = await preferences;
    setState(() {
      var a = (prefs.getBool('alarmState')?? false);
      alarmState = a;
    });

    _channelSOS.setMethodCallHandler((call) async {
      if (call.method == "someNativeFunction") {
        if (alarmState) {
          print("pressCount $pressCount");
          pressCount++;

          if (timer != null) {
            timer!.cancel(); // Stop the auto-decrementing timer
            timer = null;
          }
          // Restart the auto-decrementing timer after a delay if no further button presses occur

          if(pressCount >= 3) {
            pressCount = 0;

            await playLoudAudio();
            var message = await composeSMS();
            postSOSToFirestore();
            Fluttertoast.showToast(msg: await sendSOS(message!));
          }

          Timer(const Duration(seconds: 1), () {
            startTimer();
          });
          print("someNativeFunction");
        }
      }

      return Future.value(null);
    });
  }

  Future<void> postSOSToFirestore() async {
    const url = 'https://firestore.googleapis.com/v1/projects/unified-assist-wra4g4/databases/(default)/documents/SOS/';

    final Map<String, dynamic> body = {
      "fields": {
        "caller": {
          "stringValue": removeCountryCodeAndLeadingZero(currentPhoneNumber)
        },
        "callerName":{
          "stringValue": currentUserDisplayName
        }
      }
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Document created successfully: ${response.body}');
      } else {
        print('Failed to create document. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }


  @override
  void dispose() {
    if(timer != null) {
      timer!.cancel();
    }
    listener.cancel();
      super.dispose();
  }


  startTimer(){
    if(timer != null) {
      timer!.cancel();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {


        if(pressCount >= 1) {
          pressCount--;
        }
        else {
          timer.cancel();
        }
      });
  }

  playLoudAudio() async {
    try {
      const url = "audios/mixkit-alert-alarm-1005.wav"; // You can use either a local file or a URL

      await audioPlayer.play(AssetSource(url),
          volume: 1.0); // Set volume to 1.0 for maximum loudness
    }
    catch(exception){
      print(exception);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
