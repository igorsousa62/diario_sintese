import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_cronometrada_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_quantizada_clivagem.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_quantizada_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_verifica_simples_model.dart';

class ProtocoloModel {
  String? id;
  String? nome;
  String? descricao;
  String? tipo;

  List<EtapaVerificacaoSimplesModel>? etapaVerificacaoSimples = [];
  List<EtapaCronometradaModel>? etapaCronometrada = [];
  List<EtapaQuantizadaModel>? etapaQuantizada = [];
  List<EtapaQuantizadaClivagemModel>? etapaQuantizadaClivagem = [];

  ProtocoloModel({this.nome, this.tipo, this.descricao, this.etapaVerificacaoSimples, this.etapaCronometrada, this.etapaQuantizada, this.etapaQuantizadaClivagem});

  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('protocolo/$id');

  Future<void> saveData() async{

    deleteData();

    id == null;

    if (id == null) {
      DocumentReference docRef = FirebaseFirestore.instance.collection("protocolo").doc();

      docRef.set(toMap());

      FirebaseFirestore.instance.collection("protocolo").doc(docRef.id).set({
        "id": docRef.id,
        "nome": nome,
        "tipo": tipo,
        "descricao": descricao,
        "etapa_quantizada": etapaQuantizada != null ? List<dynamic>.from(etapaQuantizada!.map((x) => x.toMap())) : "",
        "etapa_quantizada_clivagem": etapaQuantizadaClivagem != null ? List<dynamic>.from(etapaQuantizadaClivagem!.map((x) => x.toMap())) : "",
        "etapa_simplificada": etapaVerificacaoSimples != null ? List<dynamic>.from(etapaVerificacaoSimples!.map((x) => x.toMap())) : "",
        "etapa_cronometrada": etapaCronometrada != null ? List<dynamic>.from(etapaCronometrada!.map((x) => x.toMap())) : "",
      });
    } else {
      await FirebaseFirestore.instance.collection("protocolo").doc(id).set(toMap());
    }
  }

  Future<void> deleteData() async{
    await FirebaseFirestore.instance.collection("protocolo").doc(id).delete();
  }


  Map<String, dynamic> toMap(){
    return {
      'nome': nome,
      'tipo': tipo,
      'descricao': descricao,
      "etapa_quantizada": etapaQuantizada != null ? List<dynamic>.from(etapaQuantizada!.map((x) => x.toMap())) : "",
      "etapa_quantizada_clivagem": etapaQuantizadaClivagem != null ? List<dynamic>.from(etapaQuantizadaClivagem!.map((x) => x.toMap())) : "",
      "etapa_simplificada": etapaVerificacaoSimples != null ? List<dynamic>.from(etapaVerificacaoSimples!.map((x) => x.toMap())) : "",
      "etapa_cronometrada": etapaCronometrada != null ? List<dynamic>.from(etapaCronometrada!.map((x) => x.toMap())) : "",
    };
  }

  ProtocoloModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    nome = documentSnapshot!["nome"];
    tipo = documentSnapshot!["tipo"];
    descricao = documentSnapshot!["descricao"];

    if (documentSnapshot['etapa_quantizada'] != "") {
      etapaQuantizada = <EtapaQuantizadaModel>[];
      documentSnapshot['etapa_quantizada'].forEach((v) {
        etapaQuantizada!.add(
            EtapaQuantizadaModel.fromJson(v));
      });
    }

    if (documentSnapshot['etapa_quantizada_clivagem'] != "") {
    etapaQuantizadaClivagem = <EtapaQuantizadaClivagemModel>[];
    documentSnapshot['etapa_quantizada_clivagem'].forEach((v) {
      etapaQuantizadaClivagem!.add(
    EtapaQuantizadaClivagemModel.fromJson(v));
    });
    }

    if (documentSnapshot['etapa_simplificada'] != "") {
      etapaVerificacaoSimples = <EtapaVerificacaoSimplesModel>[];
      documentSnapshot['etapa_simplificada'].forEach((v) {
        etapaVerificacaoSimples!.add(
            EtapaVerificacaoSimplesModel.fromJson(v));
      });
    }

    if (documentSnapshot['etapa_cronometrada'] != "") {
      etapaCronometrada = <EtapaCronometradaModel>[];
      documentSnapshot['etapa_cronometrada'].forEach((v) {
        etapaCronometrada!.add(
            EtapaCronometradaModel.fromJson(v));
      });
    }
  }

  ProtocoloModel.fromJson(Map<String, dynamic> map) {
    nome = map["nome"];
    tipo = map["tipo"];
    descricao = map["descricao"];

    if (map['etapa_quantizada'] != "") {
      etapaQuantizada = <EtapaQuantizadaModel>[];
      map['etapa_quantizada'].forEach((v) {
        etapaQuantizada!.add(
            EtapaQuantizadaModel.fromJson(v));
      });
    }

    if (map['etapa_quantizada_clivagem'] != "") {
      etapaQuantizadaClivagem = <EtapaQuantizadaClivagemModel>[];
      map['etapa_quantizada_clivagem'].forEach((v) {
        etapaQuantizadaClivagem!.add(
            EtapaQuantizadaClivagemModel.fromJson(v));
      });
    }

    if (map['etapa_simplificada'] != "") {
      etapaVerificacaoSimples = <EtapaVerificacaoSimplesModel>[];
      map['etapa_simplificada'].forEach((v) {
        etapaVerificacaoSimples!.add(
            EtapaVerificacaoSimplesModel.fromJson(v));
      });
    }

    if (map['etapa_cronometrada'] != "") {
      etapaCronometrada = <EtapaCronometradaModel>[];
      map['etapa_cronometrada'].forEach((v) {
        etapaCronometrada!.add(
            EtapaCronometradaModel.fromJson(v));
      });
    }
  }
}