import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../useersdata.dart';

class Auth {
  register(
      {required emaill,
      required passwordd,
      required name,
      required imagename,
      required imagepath,
      required title}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emaill,
        password: passwordd,
      );
      print("Register only");

      CollectionReference users =
          FirebaseFirestore.instance.collection("usersdoc");
      UsersData userdata = UsersData(
          password: passwordd, email: emaill, name: name, title: title);

      users
          .doc(credential.user!.uid)
          .set(userdata.ToMap())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    } on FirebaseException catch (e) {
      print(e.toString());
    }
  }
}
