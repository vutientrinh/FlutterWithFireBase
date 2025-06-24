import 'package:flutterwithfirebase/consts/consts.dart';

class FireStoreServices{
  static getUser(uid){
    return firestore.collection(usersCollection).where('id',isEqualTo: uid).snapshots();
  }
}