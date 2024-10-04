import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class BotController extends ChangeNotifier {
  BotController() : super() {}

  bool _loading = true;

  bool get loading => _loading;

  changeLoadingState(bool state) {
    _loading = state;
    notifyListeners();
  }

  final DatabaseReference database = FirebaseDatabase.instance.ref();

  forward() async {
    // Write data to Firebase Realtime Database
    await database.child('drive').update( {"forward": true}).then((_) {
      // Show success message
      print("Data upload successful: forward");
    }).catchError((error) {
      // Handle errors
      print('Failed to send data: $error');
    });
  }

  right() async {
    // Write data to Firebase Realtime Database
    await database.child('drive').update({"right": true}).then((_) {
      // Show success message
      print("Data upload successful: forward");
    }).catchError((error) {
      // Handle errors
      print('Failed to send data: $error');
    });
  }

  left() async {
    // Write data to Firebase Realtime Database
    await database.child('drive').update({"left": true}).then((_) {
      // Show success message
      print("Data upload successful: forward");
    }).catchError((error) {
      // Handle errors
      print('Failed to send data: $error');
    });
  }

  backward() async {
    // Write data to Firebase Realtime Database
    await database.child('drive').update({"backward": true}).then((_) {
      // Show success message
      print("Data upload successful: forward");
    }).catchError((error) {
      // Handle errors
      print('Failed to send data: $error');
    });
  }

  off() async {
    Map<String, dynamic> off = {
      "forward": false,
      "backward": false,
      "left":false,
      "right":false
    };
    await database.child('drive').update(off).then((_) {
      // Show success message
      print("Data upload successful: off");
    }).catchError((error) {
      // Handle errors
      print('Failed to send data: $error');
    });
  }
}
