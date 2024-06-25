import 'package:firebase_storage/firebase_storage.dart';

geturl({required imgname, required imgpath}) async {
  final storageRef = FirebaseStorage.instance.ref(imgname);
  storageRef.putFile(imgpath);
  String url = await storageRef.getDownloadURL();

  return url;

//   UploadTask uploadTask = storageRef.putData(imgpath);
//   TaskSnapshot snap = await uploadTask;
//   String url = await snap.ref.getDownloadURL();
}
