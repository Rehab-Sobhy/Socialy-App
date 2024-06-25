import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/features/auth/Login.dart';
import 'package:instagram/features/auth/auth_functions.dart';
import 'package:instagram/utils/styles.dart';
import 'package:instagram/utils/widgets/customtextfield.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController tiltecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isloading = true;
  late String imgname;
  late File imgpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            "Register ",
            style: Styles.TextStyle20.copyWith(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  imgpath == null
                      ? const CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/OIP.jpg"),
                        )
                      : ClipOval(
                          child: Image.file(
                            imgpath,
                            height: 145,
                            width: 145,
                            fit: BoxFit.cover,
                          ),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 41,
                      child: IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.deepOrange,
                                content: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (() async {
                                        final pickimg1 = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        try {
                                          if (pickimg1 != null) {
                                            setState(() {
                                              imgpath = File(pickimg1.path);
                                            });
                                          }
                                        } on Exception catch (e) {
                                          print("cant Upload image");
                                        }
                                      }),
                                      child: Row(
                                        children: [
                                          Icon(Icons.camera),
                                          Text("Camera"),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (() async {
                                        final pickimg1 = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);

                                        try {
                                          if (pickimg1 != null) {
                                            setState(() {
                                              imgpath = File(pickimg1.path);
                                            });
                                          }
                                        } on Exception catch (e) {
                                          print("cant Upload image");
                                        }
                                      }),
                                      child: Row(
                                        children: [
                                          Icon(Icons.browse_gallery),
                                          Text("Gallery"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          )))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller1: namecontroller,
                hinttext: 'Enter Your  Name',
                text_Field_Icon: const Icon(Icons.person, color: Colors.white),
              ),
              CustomTextFormField(
                controller1: tiltecontroller,
                hinttext: 'Enter Your  title',
                text_Field_Icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              CustomTextFormField(
                controller1: emailcontroller,
                hinttext: 'Enter Your Mail',
                text_Field_Icon: const Icon(Icons.mail, color: Colors.white),
              ),
              CustomTextFormField(
                controller1: passwordcontroller,
                hinttext: 'Enter Strong  Password',
                text_Field_Icon:
                    const Icon(Icons.visibility, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    Auth().register(
                        emaill: emailcontroller.text,
                        passwordd: passwordcontroller.text,
                        name: namecontroller.text,
                        title: tiltecontroller.text,
                        imagename: null,
                        imgpath: imgpath);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.deepOrange,
                        content: Text("Signed up successfully 🥳")));
                  } catch (ex) {
                    // ignore: use_build_context_synchronously
                    print(ex.toString());
                    showDialog(
                        context: context,
                        builder: (BuildContextcontext) {
                          return const AlertDialog(
                            content: Text("Error 😔,Try again"),
                          );
                        });
                  }
                },
                child: Text(
                  isloading == false ? "loading" : "Register",
                  style: Styles.TextStyle16.copyWith(color: Colors.white),
                ),
                style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.pinkAccent)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => LoginView())));
                  },
                  child: Text(
                    " Have an account ? Login Now 👉",
                    style: Styles.TextStyle14.copyWith(color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
