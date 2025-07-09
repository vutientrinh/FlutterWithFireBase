import 'package:flutterwithfirebase/consts/consts.dart';

class FireStoreServices{
  static getUser(uid){
    return firestore.collection(usersCollection).doc(uid).snapshots();
  }
  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();
  }
}