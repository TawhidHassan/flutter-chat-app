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

  createChatRoom(chatRoom, chatRoomId){
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getUserInfo(String email)async {
    return Firestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .getDocuments()
        .catchError((e) {
      print(e.toString());
    });
  }


}