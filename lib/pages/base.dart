import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:just_audio/just_audio.dart';
import 'package:unified_assist/pages/sms_functions.dart';
import 'package:audioplayers/audioplayers.dart';

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
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  bool alarmState = false;

  @override
  void initState() {
    super.initState();
    pressCount = 0;
    initializeVolumeListener();
  }

  initializeVolumeListener() async {
    final SharedPreferences prefs = await preferences;
    setState(() {
      alarmState = (prefs.getBool('alarmState')?? false);
    });

    _volumeBtnChannel.setMethodCallHandler((call) async {
      if (call.method == "volumeBtnPressed") {
        if (call.arguments == "volume_down" && alarmState) {
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
            Fluttertoast.showToast(msg: await sendSOS(message!));
          }

          Timer(const Duration(seconds: 1), () {
            startTimer();
          });
        }
      }

      return Future.value(null);
    });
  }

  @override
  void dispose() {
    if(timer != null) {
      timer!.cancel();
    }
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
    const url = "audios/mixkit-alert-alarm-1005.wav"; // You can use either a local file or a URL

    await audioPlayer.play(AssetSource(url), volume: 1.0); // Set volume to 1.0 for maximum loudness
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
