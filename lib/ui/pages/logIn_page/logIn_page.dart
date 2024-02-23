import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texnomart/data/utils/localeKeys.dart';

import '../../../data/controllers/user_controller.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade700,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(LocaleKeys.logIn.tr),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - 80,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50, bottom: 15),
                          child: Text(
                            LocaleKeys.welcome.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const Text("Email"),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: userController.emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Password"),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          controller: userController.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Password",
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          LocaleKeys.agrement.tr,
                          style: const TextStyle(color: Colors.grey),
                          maxLines: 3,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow.shade700,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(
                          splashColor: Colors.yellow,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          onPressed: () {
                            if (userController.emailController.text.isEmpty ||
                                userController
                                    .passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Email or Password is empty, please fill it!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              userController.logInUser();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            child: Center(child: Text(LocaleKeys.logIn.tr)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            if (userController.emailController.text.isEmpty ||
                                userController
                                    .passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Email or Password is empty, please fill it!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              userController.signUpUser();
                            }
                          },
                          child: Text(
                            LocaleKeys.register.tr,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.logInWith.tr,
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
