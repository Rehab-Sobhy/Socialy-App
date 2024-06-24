import 'package:flutter/material.dart';
import 'package:instagram/utils/styles.dart';
import 'package:instagram/utils/widgets/customtextfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Sign In Screen",
            style: Styles.TextStyle30.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            CustomTextFormField(
              hinttext: 'Enter Your Mail',
              text_Field_Icon: Icon(Icons.mail, color: Colors.white),
            ),
            CustomTextFormField(
              hinttext: 'Enter Strong  Password',
              text_Field_Icon: Icon(Icons.visibility, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Logn IN",
                style: Styles.TextStyle16.copyWith(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.pinkAccent)),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Don't have an account ? Register Now 👉",
                  style: Styles.TextStyle14.copyWith(color: Colors.white),
                )),
          ],
        ));
  }
}
