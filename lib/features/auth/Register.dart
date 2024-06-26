// import 'dart:io';
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:instagram/features/auth/Login.dart';
// import 'package:instagram/features/auth/auth_functions.dart';
// import 'package:instagram/features/home/homepage.dart';
// import 'package:instagram/utils/styles.dart';
// import 'package:instagram/utils/widgets/customtextfield.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// class _RegisterViewState extends State<RegisterView> {
//   final TextEditingController namecontroller = TextEditingController();
//   final TextEditingController tiltecontroller = TextEditingController();
//   final TextEditingController emailcontroller = TextEditingController();
//   final TextEditingController passwordcontroller = TextEditingController();
//   bool isloading = true;
//   late String imgname;
//   Uint8List? imgpath;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.grey,
//           title: Text(
//             "Register ",
//             style: Styles.TextStyle20.copyWith(color: Colors.white),
//           ),
//         ),
//         backgroundColor: Colors.black,
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 50,
//               ),
//               Stack(
//                 children: [
//                   imgpath == null
//                       ? const CircleAvatar(
//                           radius: 40,
//                           backgroundImage: AssetImage("assets/images/OIP.jpg"),
//                         )
//                       : ClipOval(
//                           child: Image.memory(
//                             imgpath!,
//                             height: 145,
//                             width: 145,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                   Positioned(
//                       bottom: -10,
//                       left: 41,
//                       child: IconButton(
//                           onPressed: () {
//                             showModalBottomSheet(
//                                 backgroundColor:
//                                     Color.fromARGB(255, 168, 0, 56),
//                                 context: context,
//                                 builder: (context) {
//                                   return Container(
//                                     height: 100,
//                                     child: Column(
//                                       children: [
//                                         GestureDetector(
//                                           onTap: (() async {
//                                             final pickimg1 = await ImagePicker()
//                                                 .pickImage(
//                                                     source: ImageSource.camera);
//                                             try {
//                                               if (pickimg1 != null) {
//                                                 setState(() {
//                                                   imgpath = File(pickimg1.path)
//                                                       as Uint8List;
//                                                   Navigator.pop(context);
//                                                 });
//                                               }
//                                             } on Exception catch (e) {
//                                               print("cant Upload image");
//                                             }
//                                           }),
//                                           child: Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: 5,
//                                               ),
//                                               Icon(Icons.camera),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               Text(
//                                                 "Camera",
//                                                 style: Styles.TextStyle16,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                         ),
//                                         GestureDetector(
//                                           onTap: (() async {
//                                             final pickimg1 = await ImagePicker()
//                                                 .pickImage(
//                                                     source:
//                                                         ImageSource.gallery);

//                                             try {
//                                               if (pickimg1 != null) {
//                                                 setState(() {
//                                                   imgpath = File(pickimg1.path)
//                                                       as Uint8List;
//                                                   Navigator.pop(context);
//                                                 });
//                                               }
//                                             } on Exception catch (e) {
//                                               print("cant Upload image");
//                                             }
//                                           }),
//                                           child: Row(
//                                             children: [
//                                               SizedBox(
//                                                 width: 5,
//                                               ),
//                                               Icon(Icons
//                                                   .browse_gallery_outlined),
//                                               SizedBox(
//                                                 width: 20,
//                                               ),
//                                               Text("Gallery",
//                                                   style: Styles.TextStyle16),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 });
//                           },
//                           icon: const Icon(
//                             Icons.add_a_photo,
//                             color: Colors.white,
//                           )))
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomTextFormField(
//                 controller1: namecontroller,
//                 hinttext: 'Enter Your  Name',
//                 text_Field_Icon: const Icon(Icons.person, color: Colors.white),
//               ),
//               CustomTextFormField(
//                 controller1: tiltecontroller,
//                 hinttext: 'Enter Your  title',
//                 text_Field_Icon: const Icon(
//                   Icons.person,
//                   color: Colors.white,
//                 ),
//               ),
//               CustomTextFormField(
//                 controller1: emailcontroller,
//                 hinttext: 'Enter Your Mail',
//                 text_Field_Icon: const Icon(Icons.mail, color: Colors.white),
//               ),
//               CustomTextFormField(
//                 controller1: passwordcontroller,
//                 hinttext: 'Enter Strong  Password',
//                 text_Field_Icon:
//                     const Icon(Icons.visibility, color: Colors.white),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () async {
//                   try {
//                     Auth().register(
//                         emaill: emailcontroller.text,
//                         passwordd: passwordcontroller.text,
//                         name: namecontroller.text,
//                         title: tiltecontroller.text,
//                         imagename: null,
//                         profileImage: imgpath);

//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomepView()));
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         backgroundColor: Colors.pink,
//                         content: Text("Signed up successfully 🥳")));
//                   } catch (ex) {
//                     // ignore: use_build_context_synchronously
//                     print(ex.toString());
//                     showDialog(
//                         context: context,
//                         builder: (BuildContextcontext) {
//                           return const AlertDialog(
//                             content: Text("Error 😔,Try again"),
//                           );
//                         });
//                   }
//                 },
//                 child: Text(
//                   isloading == false ? "loading" : "Register",
//                   style: Styles.TextStyle16.copyWith(color: Colors.white),
//                 ),
//                 style: const ButtonStyle(
//                     backgroundColor: MaterialStatePropertyAll(Colors.pink)),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: ((context) => LoginView())));
//                   },
//                   child: Text(
//                     " Have an account ? Login Now 👉",
//                     style: Styles.TextStyle14.copyWith(color: Colors.white),
//                   )),
//             ],
//           ),
//         ));
//   }
// }

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/features/auth/Login.dart';
import 'package:instagram/features/auth/auth_functions.dart';
import 'package:instagram/features/home/homepage.dart';
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
  bool isloading = false;
  String? imgname;
  Uint8List? imgpath;

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
            const SizedBox(height: 50),
            Stack(
              children: [
                imgpath == null
                    ? const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/OIP.jpg"),
                      )
                    : ClipOval(
                        child: Image.memory(
                          imgpath!,
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
                      showModalBottomSheet(
                        backgroundColor: const Color.fromARGB(255, 168, 0, 56),
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 100,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final pickimg1 = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);
                                    if (pickimg1 != null) {
                                      final bytes = await File(pickimg1.path)
                                          .readAsBytes();
                                      setState(() {
                                        imgpath = bytes;
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      const Icon(Icons.camera),
                                      const SizedBox(width: 20),
                                      Text(
                                        "Camera",
                                        style: Styles.TextStyle16,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () async {
                                    final pickimg1 = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickimg1 != null) {
                                      final bytes = await File(pickimg1.path)
                                          .readAsBytes();
                                      setState(() {
                                        imgpath = bytes;
                                        Navigator.pop(context);
                                      });
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 5),
                                      const Icon(Icons.browse_gallery_outlined),
                                      const SizedBox(width: 20),
                                      Text("Gallery",
                                          style: Styles.TextStyle16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller1: namecontroller,
              hinttext: 'Enter Your  Name',
              text_Field_Icon: const Icon(Icons.person, color: Colors.white),
            ),
            CustomTextFormField(
              controller1: tiltecontroller,
              hinttext: 'Enter Your  title',
              text_Field_Icon: const Icon(Icons.person, color: Colors.white),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isloading = true;
                });
                try {
                  String imageUrl = "";
                  if (imgpath != null) {
                    // Upload image to Firebase Storage
                    final storageRef = FirebaseStorage.instance
                        .ref()
                        .child('user_images/${emailcontroller.text}.jpg');
                    await storageRef.putData(imgpath!);
                    imageUrl = await storageRef.getDownloadURL();
                  }

                  await Auth().register(
                    emaill: emailcontroller.text,
                    passwordd: passwordcontroller.text,
                    name: namecontroller.text,
                    title: tiltecontroller.text,
                    imagename: imgname,
                    profileImage: imgpath,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomepView(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.pink,
                    content: Text("Signed up successfully 🥳"),
                  ));
                } catch (ex) {
                  print(ex.toString());
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Text("Error 😔, Try again"),
                      );
                    },
                  );
                } finally {
                  setState(() {
                    isloading = false;
                  });
                }
              },
              child: Text(
                isloading ? "Loading" : "Register",
                style: Styles.TextStyle16.copyWith(color: Colors.white),
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              child: Text(
                " Have an account ? Login Now 👉",
                style: Styles.TextStyle14.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
