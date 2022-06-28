import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';

class ProtocoloController extends GetxController {

  ProtocoloModel? protocolo;

  List<ProtocoloModel>? protocolos = [];
  var documents = [];
  var loading = false.obs;
  UserLoginController controller = Get.put(UserLoginController());


  Future<void> saveProtocolo({ProtocoloModel? protocolo, Function? onFail, Function? onSucess}) async {
    setLoading(true);
    await controller.getUser();

    try {
      this.protocolo = protocolo;

      await protocolo!.saveData();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    }


    setLoading(false);
  }


  Future<void> deleteProtocolo({ProtocoloModel? protocolo, Function? onFail, Function? onSucess}) async {
    try {
      this.protocolo = protocolo;
      await protocolo!.deleteData();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    } finally {
      update();
    }
  }

  Future<List<ProtocoloModel>> getProtocolos(String tipo) async {

    setLoading(true);
    await controller.getUser();
    protocolos!.clear();
    var reference = await FirebaseFirestore.instance.collection("protocolo").where('tipo', isEqualTo: tipo);
    QuerySnapshot snap = await reference.get();
    documents = snap.docs;

    for (final doc in documents) {
      var obj =  ProtocoloModel.fromDocumentSnapshot(documentSnapshot: doc);
      protocolos!.add(obj);
    }

    protocolos!.sort((a, b) => a.nome!.compareTo(b!.nome!));

    setLoading(false);
    update();

    return protocolos!;
  }

  void setLoading(bool value){
    loading.value = value;
    update();
  }
}