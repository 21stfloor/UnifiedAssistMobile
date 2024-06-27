import 'package:flutter/scheduler.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

import '../auth/firebase_auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/lat_lng.dart';

Future<String> sendSOS(String msg) async {
  bool result;
  // List<String> recipients = ["+639954261220"];

    var contacts = await queryContactsRecordOnce(
      queryBuilder: (contactsRecord) => contactsRecord.where(
        'owner',
        isEqualTo: currentUserReference,
      ),
    );
    List<String> recipients = extractPhoneNumbers(contacts);

    if(recipients.isEmpty){
      return "You don't have any contact yet, sms will not be send!";
    }

    // Can the device send SMS?
    result = await canSendSMS();
    if (!result) {
      Fluttertoast.showToast(msg: "Device cannot send SMS messages");
      return "Device cannot send SMS messages";
    }
    print("Device can send SMS messages");

    // Do we have permission to send SMS?
    result = await Permission.sms.request().isGranted;
    if (!result) {
      Fluttertoast.showToast(msg: "Permission denied");
      return "Permission denied";
    }
    print("Permission granted");

    try {
      String result = await sendSMS(
        message: msg,
        recipients: recipients,
        sendDirect: true,
      );
      return result;
    } catch (error) {
      return error.toString();
    }
}


Future<String?> composeSMS() async {
  LatLng? currentUserLocationValue;
  await getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
      .then((loc) => currentUserLocationValue = loc);
  print('currentUserLocationValue $currentUserLocationValue');

  var mapUrl = "${currentUserLocationValue!.latitude},${currentUserLocationValue!.longitude}";

  if(currentUserLocationValue!.latitude == 0){
    return "Unified Assist SOS: I am in need of immediate assistance. Please send help as soon as possible.";
  }
  return "Unified Assist SOS: I am in need of immediate assistance. My current location is $mapUrl. Please send help as soon as possible.";
}

List<String> extractPhoneNumbers(List<ContactsRecord> records) {
  List<String> phoneNumbers = [];
  for (var record in records) {
    if (record.hasPhoneNumber()) {
      phoneNumbers.add(record.phoneNumber);
    }
  }
  return phoneNumbers;
}