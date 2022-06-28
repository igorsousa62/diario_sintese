import 'package:cloud_firestore/cloud_firestore.dart';

class EtapaQuantizadaModel {
  String? id;
  String? descricao;
  String? tipo;
  String? dataHora;
  String? g_massa;
  String? eq_massa;
  String? mol_volume;
  String? eq_volume;
  DateTime? dataReal;
  bool? feito;

  EtapaQuantizadaModel({this.descricao, this.tipo, this.dataHora, this.g_massa, this.eq_massa, this.mol_volume, this.eq_volume,
                        this.dataReal, this.feito});

  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "tipo": tipo,
      "dataHora": dataHora,
      "g_massa": g_massa,
      "eq_massa": eq_massa,
      "mol_volume": mol_volume,
      "eq_volume": eq_volume
    };
  }

  EtapaQuantizadaModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    descricao = documentSnapshot!["descricao"];
    dataHora = documentSnapshot!["dataHora"];
    g_massa = documentSnapshot["g_massa"];
    eq_massa = documentSnapshot["eq_massa"];
    mol_volume = documentSnapshot["mol_volume"];
    eq_volume = documentSnapshot["eq_volume"];
    dataReal = documentSnapshot!["dataHora"] as DateTime;
    feito = false;
  }

  EtapaQuantizadaModel.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    tipo = map["tipo"];
    dataHora = map["dataHora"];
    g_massa = map["g_massa"];
    eq_massa = map["eq_massa"];
    mol_volume = map["mol_volume"];
    eq_volume = map["eq_volume"];
    dataReal = DateTime.parse(map!["dataHora"]);
    feito = false;
  }
}