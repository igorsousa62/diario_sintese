import 'package:cloud_firestore/cloud_firestore.dart';

class EtapaVerificacaoSimplesModel {
  String? id;
  String? descricao;
  String? dataHora;
  DateTime? dataReal;
  bool? feito;

  EtapaVerificacaoSimplesModel({this.descricao, this.dataHora, this.dataReal, this.feito});

  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "dataHora": dataHora,
    };
  }

  EtapaVerificacaoSimplesModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    descricao = documentSnapshot!["descricao"];
    dataHora = documentSnapshot!["dataHora"];
    dataReal = documentSnapshot!["dataHora"] as DateTime;
    feito = false;
  }

  EtapaVerificacaoSimplesModel.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    dataHora = map["dataHora"];
    dataReal = DateTime.parse(map!["dataHora"]);
    feito = false;
  }
}