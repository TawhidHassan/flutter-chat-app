import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth.dart';
import 'package:flutter_chat_app/widgets/widget.dart';

import 'chatsRooms.dart';
import 'forgetpassword.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  AuthService authService = new AuthService();

  singUp() async {
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });

      authService.signUpWithEmailAndPassword(emailEditingController.text, passwordEditingController.text)
      .then((result){
        if(result != null){
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => ChatRoom()
          ));
        }
      });
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarMain(context),
        body: isLoading ? Container(child: Center(child: CircularProgressIndicator(),),) : SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height-50,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                 Form(
                   key: formKey,
                   child: Column(
                     children: [
                       TextFormField(
                           validator: (val){
                             return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                           },
                           controller: usernameEditingController,
                           decoration: textFieldInputDecoration("User Name") ,
                           style: simpleTextStyle()
                       ),TextFormField(
                           validator: (val){
                             return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                             null : "Enter correct email";
                           },
                           controller: emailEditingController,
                           decoration: textFieldInputDecoration("Email") ,
                           style: simpleTextStyle()
                       ),TextFormField(
                           validator:  (val){
                             return val.length < 6 ? "Enter Password 6+ characters" : null;
                           },
                           controller: passwordEditingController,
                           decoration: textFieldInputDecoration("Password") ,
                           style: simpleTextStyle()
                       ),
                     ],
                   ),
                 ),

                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      singUp();
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
