import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  storge({required imgname, required imgpath}) async {
    final storageRef = FirebaseStorage.instance.ref(imgname);
    storageRef.putFile(imgpath);
  }
}
