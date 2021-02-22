import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUser(String username){

  }

  uploadUserInfo(userMasp){
    Firestore.instance.collection("users")
        .add(userMasp);

  }

}