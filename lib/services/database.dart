import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  getUserByUsername(String searchField){
     return Firestore.instance.collection("users")
          .where('userName', isEqualTo: searchField)
          .getDocuments();
  }

  uploadUserInfo(userMasp){
    Firestore.instance.collection("users")
        .add(userMasp);

  }

}