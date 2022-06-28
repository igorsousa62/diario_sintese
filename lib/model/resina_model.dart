import 'package:cloud_firestore/cloud_firestore.dart';

class ResinaModel {
  String? id;
  String? nome;
  String? grauSubstituicao;
  String? descricao;

  ResinaModel({this.nome, this.grauSubstituicao, this.descricao});

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('resinas/$id');

  Future<void> saveData() async{
    if (id == null) {
      DocumentReference docRef = FirebaseFirestore.instance.collection("resinas").doc();

      docRef.set(toMap());

      FirebaseFirestore.instance.collection("resinas").doc(docRef.id).set({
        "id": docRef.id,
        "nome": nome,
        "grauSubstituicao": grauSubstituicao,
        "descricao": descricao
      });
    } else {
      await FirebaseFirestore.instance.collection("resinas").doc(id).set(toMap());
    }
  }

  Future<void> deleteData() async{
    await FirebaseFirestore.instance.collection("resinas").doc(id).delete();
  }


  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      'grauSubstituicao': grauSubstituicao,
      'descricao': descricao,
    };
  }

  ResinaModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    nome = documentSnapshot!["nome"];
    grauSubstituicao = documentSnapshot!["grauSubstituicao"];
    descricao = documentSnapshot!["descricao"];
  }

  ResinaModel.fromJson(Map<String, dynamic> map) {
    nome = map["nome"];
    grauSubstituicao = map["grauSubstituicao"];
    descricao = map["descricao"];
  }
}