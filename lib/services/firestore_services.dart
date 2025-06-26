import 'package:flutterwithfirebase/consts/consts.dart';

class FireStoreServices{
  static getUser(uid){
    return firestore.collection(usersCollection).doc(uid).snapshots();
  }
}