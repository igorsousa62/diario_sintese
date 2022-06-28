import 'package:cloud_firestore/cloud_firestore.dart';

class EtapaCronometradaModel {
  String? id;
  String? descricao;
  String? tempo;
  String? dataHora;
  DateTime? dataReal;
  bool? feito;

  EtapaCronometradaModel({this.descricao, this.tempo, this.dataHora, this.dataReal, this.feito});

  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "tempo": tempo,
      "dataHora": dataHora,
    };
  }

  EtapaCronometradaModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    descricao = documentSnapshot!["descricao"];
    tempo = documentSnapshot!["tempo"];
    dataHora = documentSnapshot!["dataHora"];
    dataReal = documentSnapshot!["dataHora"] as DateTime;
    feito = false;
  }

  EtapaCronometradaModel.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    tempo = map["tempo"];
    dataHora = map["dataHora"];
    dataReal = DateTime.parse(map!["dataHora"]);
    feito = false;
  }
}