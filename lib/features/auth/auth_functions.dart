import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../useersdata.dart';

class Auth {
  register(
      {required emaill,
      required passwordd,
      required name,
      required title}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emaill,
        password: passwordd,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    UsersData userdata =
        UsersData(password: passwordd, email: emaill, name: name, title: title);
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersdoc');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            userdata.ToMap(),
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    print("usera dded to database");
  }
}
