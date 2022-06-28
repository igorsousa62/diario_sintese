import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/model/residuo_aa_model.dart';
import 'package:meu_diario_de_sintese/model/resina_model.dart';
import 'package:meu_diario_de_sintese/model/user_model.dart';

class SinteseModel {
  String? id;
  String? nomePeptideo;
  String? sequenciaPeptideo;
  String? dataHora;
  ResiduoAAModel? residuoAAModel;
  ResinaModel? resinaModel;
  String? tipoMassa;
  String? qtdMassa;

  ProtocoloModel? acoplamento;
  ProtocoloModel? desprotecao;
  ProtocoloModel? clivagem;
  UserModel? user;

  SinteseModel({this.nomePeptideo, this.sequenciaPeptideo, this.residuoAAModel, this.resinaModel, this.tipoMassa, this.qtdMassa, this.acoplamento,
                this.desprotecao, this.clivagem, this.dataHora, this.user});


  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('sintese/$id');

  Future<void> saveData() async{

    deleteData();

    id == null;

    if (id == null) {
      DocumentReference docRef = FirebaseFirestore.instance.collection("sintese").doc();

      docRef.set(toMap());

      FirebaseFirestore.instance.collection("sintese").doc(docRef.id).set({
        "id": docRef.id,
        "nomePeptideo": nomePeptideo,
        "sequenciaPeptideo": sequenciaPeptideo,
        "dataHora": DateTime.now().toString(),
        "residuoAAModel": residuoAAModel != null ? residuoAAModel!.toMap() : "",
        "resinaModel": resinaModel != null ? resinaModel!.toMap() : "",
        "tipoMassa": tipoMassa,
        "qtdMassa": qtdMassa,
        "acoplamento": acoplamento != null ? acoplamento!.toMap() : "",
        "clivagem": clivagem != null ? clivagem!.toMap() : "",
        "desprotecao": desprotecao != null ? desprotecao!.toMap() : "",
        "user": user!.id
      });
    } else {
      await FirebaseFirestore.instance.collection("sintese").doc(id).set(toMap());
    }
  }

  Future<void> deleteData() async{
    await FirebaseFirestore.instance.collection("sintese").doc(id).delete();
  }

  Map<String, dynamic> toMap(){
    return {
      "nomePeptideo": nomePeptideo,
      "sequenciaPeptideo": sequenciaPeptideo,
      "dataHora": DateTime.now().toString(),
      "residuoAAModel": residuoAAModel != null ? residuoAAModel!.toMap() : "",
      "resinaModel": resinaModel != null ? resinaModel!.toMap() : "",
      "tipoMassa": tipoMassa,
      "qtdMassa": qtdMassa,
      "acoplamento": acoplamento != null ? acoplamento!.toMap() : "",
      "desprotecao": desprotecao != null ? desprotecao!.toMap() : "",
      "clivagem": clivagem != null ? clivagem!.toMap() : "",
      "user": user!.id
    };
  }

  SinteseModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    nomePeptideo = documentSnapshot!["nomePeptideo"];
    sequenciaPeptideo = documentSnapshot!["sequenciaPeptideo"];
    dataHora = documentSnapshot!["dataHora"];
    tipoMassa = documentSnapshot!["tipoMassa"];
    qtdMassa = documentSnapshot!["qtdMassa"];

    if (documentSnapshot['residuoAAModel'] != "") {
      residuoAAModel = ResiduoAAModel.fromJson(documentSnapshot['residuoAAModel']);
    }

    if (documentSnapshot['resinaModel'] != "") {
      resinaModel = ResinaModel.fromJson(documentSnapshot['resinaModel']);
    }

    if (documentSnapshot['acoplamento'] != "") {
      acoplamento = ProtocoloModel.fromJson(documentSnapshot['acoplamento']);
    }

    if (documentSnapshot['desprotecao'] != "") {
      desprotecao = ProtocoloModel.fromJson(documentSnapshot['desprotecao']);
    }

    if (documentSnapshot['clivagem'] != "") {
      clivagem = ProtocoloModel.fromJson(documentSnapshot['clivagem']);
    }
  }
}