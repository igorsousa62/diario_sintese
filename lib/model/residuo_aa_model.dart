import 'package:cloud_firestore/cloud_firestore.dart';

class ResiduoAAModel {
  String? id;
  String? nome;
  String? sigla;
  String? simbolo;
  String? massaMolarProtegido;
  String? massaMolarDesprotegido;
  String? grupoProtetor;
  String? descricao;

  ResiduoAAModel({this.nome, this.sigla, this.simbolo, this.massaMolarProtegido, this.massaMolarDesprotegido, this.descricao});

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('residuoAA/$id');

  Future<void> saveData() async{
    if (id == null) {
      DocumentReference docRef = FirebaseFirestore.instance.collection("residuoAA").doc();

      docRef.set(toMap());

      FirebaseFirestore.instance.collection("residuoAA").doc(docRef.id).set({
        "id": docRef.id,
        "nome": nome,
        "sigla": sigla,
        "simbolo": simbolo,
        "massaMolarProtegido": massaMolarProtegido,
        "massaMolarDesprotegido": massaMolarDesprotegido,
        "grupoProtetor": grupoProtetor,
        "descricao": descricao
      });
    } else {
      await FirebaseFirestore.instance.collection("residuoAA").doc(id).set(toMap());
    }
  }

  Future<void> deleteData() async{
    await FirebaseFirestore.instance.collection("residuoAA").doc(id).delete();
  }


  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      "sigla": sigla,
      "simbolo": simbolo,
      "massaMolarProtegido": massaMolarProtegido,
      "massaMolarDesprotegido": massaMolarDesprotegido,
      "grupoProtetor": grupoProtetor,
      "descricao": descricao
    };
  }

  ResiduoAAModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    nome = documentSnapshot!["nome"];
    sigla = documentSnapshot!["sigla"];
    simbolo = documentSnapshot["simbolo"];
    massaMolarProtegido = documentSnapshot["massaMolarProtegido"];
    massaMolarDesprotegido = documentSnapshot["massaMolarDesprotegido"];
    grupoProtetor = documentSnapshot["grupoProtetor"];
    descricao = documentSnapshot!["descricao"];
  }

  ResiduoAAModel.fromJson(Map<String, dynamic> map) {
    nome = map["nome"];
    sigla = map["sigla"];
    simbolo = map["simbolo"];
    massaMolarProtegido = map["massaMolarProtegido"];
    massaMolarDesprotegido = map["massaMolarDesprotegido"];
    grupoProtetor = map["grupoProtetor"];
    descricao = map!["descricao"];
  }
}