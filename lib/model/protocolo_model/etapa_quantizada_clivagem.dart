import 'package:cloud_firestore/cloud_firestore.dart';

class EtapaQuantizadaClivagemModel {
  String? id;
  String? descricao;
  String? desc_residuo;
  String? tipo;
  String? tipo_quant;
  String? dataHora;
  String? g_massa;
  String? eq_massa;
  String? mol_volume;
  String? eq_volume;
  DateTime? dataReal;
  bool? feito;

  EtapaQuantizadaClivagemModel({this.descricao, this.desc_residuo, this.tipo, this.tipo_quant, this.dataHora, this.g_massa, this.eq_massa, this.mol_volume, this.eq_volume,
                                this.dataReal, this.feito});

  Map<String, dynamic> toMap(){
    return {
      'desc_residuo': desc_residuo,
      'descricao': descricao,
      "tipo": tipo,
      "tipo_quant": tipo_quant,
      "dataHora": dataHora,
      "g_massa": g_massa,
      "eq_massa": eq_massa,
      "mol_volume": mol_volume,
      "eq_volume": eq_volume
    };
  }


  EtapaQuantizadaClivagemModel.fromJson(Map<String, dynamic> map) {
    desc_residuo = map["desc_residuo"];
    descricao = map["descricao"];
    tipo = map["tipo"];
    tipo_quant = map["tipo_quant"];
    dataHora = map["dataHora"];
    g_massa = map["g_massa"];
    eq_massa = map["eq_massa"];
    mol_volume = map["mol_volume"];
    eq_volume = map["eq_volume"];
    dataReal = DateTime.parse(map!["dataHora"]);
    feito = false;
  }
}