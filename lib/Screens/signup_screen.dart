import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:createNavBar/Screens/homePage.dart';
import 'package:createNavBar/Utils/colors_utils.dart';
import 'package:createNavBar/reusable_widgets/reusable_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _userNameTexController = TextEditingController();
    TextEditingController _emailTextController = TextEditingController();
    TextEditingController _passwordTexController = TextEditingController();

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("000000"),
          hexStringToColor("323232"),
          hexStringToColor("999999")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              reusableTextfiled("Enter UserName", Icons.person_outline, false,
                  _userNameTexController),
              const SizedBox(
                height: 20,
              ),
              reusableTextfiled("Enter Email Id", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextfiled("Enter Password", Icons.lock_outline, true,
                  _passwordTexController),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTexController.text)
                    .then((value) {
                  print("Created New Account");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(title: ("Fluter Demo Page"))));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              })
            ],
          ),
        )),
      ),
    );
  }
}
