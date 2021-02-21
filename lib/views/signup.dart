import 'package:flutter/material.dart';
import 'package:flutter_chat_app/widgets/widget.dart';

import 'forgetpassword.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-50,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: usernameEditingController,
                      decoration: textFieldInputDecoration("User Name") ,
                      style: simpleTextStyle()
                  ),TextField(
                    controller: emailEditingController,
                      decoration: textFieldInputDecoration("Email") ,
                      style: simpleTextStyle()
                  ),TextField(
                    controller: passwordEditingController,
                      decoration: textFieldInputDecoration("Password") ,
                      style: simpleTextStyle()
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      // signIn();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xff007EF4),
                              const Color(0xff2A75BC)
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Sign Up",
                        style: biggerTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign up with Google",
                      style:
                      TextStyle(fontSize: 17, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "If have account? ",
                        style: simpleTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          // widget.toggleView();
                        },
                        child: Text(
                          "Login now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
