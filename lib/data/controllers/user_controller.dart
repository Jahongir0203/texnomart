import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/services/firebase_service.dart';

class UserController extends GetxController {
  final FirebaseService _firebaseService;

  UserController(this._firebaseService);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxBool _isLoading = false.obs;
  var user = Rx<User?>(null);

  RxBool get isLoading => _isLoading;

  logInUser() async {
    _isLoading.value = true;
    UserCredential? userCredential = await _firebaseService.logInUser(
        emailController.text, passwordController.text);

    if (userCredential != null) {
      _isLoading.value = true;
      user.value=FirebaseAuth.instance.currentUser;
      Get.back();
    }
  }

  signUpUser() async {
    _isLoading.value = true;
    UserCredential? userCredential = await _firebaseService.signUpUser(
        emailController.text, passwordController.text);

    if (userCredential != null) {
      _isLoading.value = false;
      user.value=FirebaseAuth.instance.currentUser;

      Get.back();
    }
  }

  signOutUser() async {
    _isLoading.value = true;
    await _firebaseService.logOutUser();
    user.value=FirebaseAuth.instance.currentUser;
    _isLoading.value = false;

  }

  @override
  void onInit() {
    super.onInit();
    user.value = FirebaseAuth.instance.currentUser;
  }
}
