import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? pass;

  UserModel({this.id, this.email, this.pass});

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('users/$id');

  Future<void> saveData() async{
    await firestoreRef.set(toMap());
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'email': email,
    };
  }

  UserModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    name = documentSnapshot!["name"];
    email = documentSnapshot!["email"];
  }

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
    email = map["email"];
    pass = map["pass"];
  }
}