import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/model/resina_model.dart';

class ResinaController extends GetxController {

  ResinaModel? resina;
  List<ResinaModel>? resinas = [];
  var documents = [];
  var loading = false.obs;
  UserLoginController controller = Get.put(UserLoginController());

  Future<void> saveResina({ResinaModel? resina, Function? onFail, Function? onSucess}) async {
    setLoading(true);
    await controller.getUser();

    try {
      this.resina = resina;

      await resina!.saveData();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    }

    await getResinas();

    setLoading(false);
  }


  Future<void> deleteResina({ResinaModel? resina, Function? onFail, Function? onSucess}) async {
    try {
      this.resina = resina;
      await resina!.deleteData();
      await getResinas();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    } finally {
      update();
    }
  }

  Future<List<ResinaModel>> getResinas() async {

    setLoading(true);
    await controller.getUser();
    resinas!.clear();
    CollectionReference reference = await FirebaseFirestore.instance.collection("resinas");
    QuerySnapshot snap = await reference.get();
    documents = snap.docs;

    for (final doc in documents) {
      var obj =  ResinaModel.fromDocumentSnapshot(documentSnapshot: doc);
      resinas!.add(obj);
    }

    resinas!.sort((a, b) => a.nome!.compareTo(b!.nome!));

    setLoading(false);
    update();

    return resinas!;

  }

  void setLoading(bool value){
    loading.value = value;
    update();
  }
}