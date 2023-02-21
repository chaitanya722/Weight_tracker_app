import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weight_tracker_app/main.dart';
import 'package:weight_tracker_app/sign_in.dart';
import 'package:weight_tracker_app/weight_entry.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print("SignIN page");
      Get.offAll(() => SignInPage());
    } else {
      Get.offAll(() => MyHomePage(
            title: "nin",
          ));
    }
  }

  void signIn(String trim, String text) {}
}

void signIn(String email, password) async {
  try {
    var auth;
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    Get.snackbar("About User", "User message",
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Sign IN failed ",
          style: TextStyle(color: Colors.white),
        ),
        messageText: Text(e.toString(), style: TextStyle(color: Colors.white)));
  }
}
