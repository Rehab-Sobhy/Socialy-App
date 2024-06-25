import 'package:firebase_storage/firebase_storage.dart';

geturl({required imgname, required imgpath}) async {
  final storageRef = FirebaseStorage.instance.ref(imgname);
  storageRef.putFile(imgpath);
  String url = await storageRef.getDownloadURL();
  return url;
}
