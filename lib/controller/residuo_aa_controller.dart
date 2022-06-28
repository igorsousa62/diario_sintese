import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/model/residuo_aa_model.dart';

class ResiduoAAController extends GetxController {

  ResiduoAAModel? ResiduoAA;
  List<ResiduoAAModel>? ResiduoAAs = [];
  var documents = [];
  var loading = false.obs;
  UserLoginController controller = Get.put(UserLoginController());


  Future<void> saveResiduoAA({ResiduoAAModel? ResiduoAA, Function? onFail, Function? onSucess}) async {
    setLoading(true);
    await controller.getUser();

    try {
      this.ResiduoAA = ResiduoAA;

      await ResiduoAA!.saveData();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    }

    await getResiduoAAs();

    setLoading(false);
  }


  Future<void> deleteResiduoAA({ResiduoAAModel? ResiduoAA, Function? onFail, Function? onSucess}) async {
    try {
      this.ResiduoAA = ResiduoAA;
      await ResiduoAA!.deleteData();
      await getResiduoAAs();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    } finally {
      update();
    }
  }

  Future<void> getResiduoAAs() async {

    setLoading(true);
    await controller.getUser();
    ResiduoAAs!.clear();
    CollectionReference reference = await FirebaseFirestore.instance.collection("residuoAA");
    QuerySnapshot snap = await reference.get();
    documents = snap.docs;

    for (final doc in documents) {
      var obj =  ResiduoAAModel.fromDocumentSnapshot(documentSnapshot: doc);
      ResiduoAAs!.add(obj);
    }

    ResiduoAAs!.sort((a, b) => a.nome!.compareTo(b!.nome!));

    setLoading(false);
    update();

  }

  void setLoading(bool value){
    loading.value = value;
    update();
  }

  Future<List<ResiduoAAModel>> aaByTipo(String tipo) async {
    setLoading(true);
    await controller.getUser();
    ResiduoAAs!.clear();
    CollectionReference reference = await FirebaseFirestore.instance.collection("residuoAA");
    QuerySnapshot snap = await reference.get();
    documents = snap.docs;

    for (final doc in documents) {
      var obj =  ResiduoAAModel.fromDocumentSnapshot(documentSnapshot: doc);
      ResiduoAAs!.add(obj);
    }

    ResiduoAAs!.sort((a, b) => a.nome!.compareTo(b!.nome!));

    setLoading(false);
    update();

    if (tipo == '') {
      return ResiduoAAs!;
    } else {
      return ResiduoAAs!.where((element) => element.simbolo == tipo).toList();
    }
  }
}