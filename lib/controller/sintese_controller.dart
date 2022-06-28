import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/model/residuo_model.dart';
import 'package:meu_diario_de_sintese/model/sintese_model.dart';

class SinteseController extends GetxController {

  var documents = [];
  var loading = false.obs;
  List<SinteseModel>? sinteses = [];
  UserLoginController controller = Get.put(UserLoginController());

  Future<List<SinteseModel>> getSintese() async {

    setLoading(true);
    await controller.getUser();
    sinteses!.clear();
    var reference = await FirebaseFirestore.instance.collection("sintese").where('user', isEqualTo: controller.user!.id);
    QuerySnapshot snap = await reference.get();
    documents = snap.docs;

    for (final doc in documents) {
      var obj =  SinteseModel.fromDocumentSnapshot(documentSnapshot: doc);
      sinteses!.add(obj);
    }

    setLoading(false);
    update();

    return sinteses!;
  }

  SinteseModel? sinteseModel;
  Rx<String> tipoMassa = ''.obs;

  void NovaSintese() {
    sinteseModel = SinteseModel();
    index == 0.obs;
    tipoMassa.value = '';
  }


  Rx<int> index = 0.obs;

  RxList<ResiduoModel> listResiduos = [
    ResiduoModel(name: "Ala", symobol: "A", image: "assets/ala.PNG"),
    ResiduoModel(name: "Gln", symobol: "Q", image: "assets/gln.PNG"),
    ResiduoModel(name: "Cys", symobol: "C", image: "assets/cys.PNG"),
    ResiduoModel(name: "Asn", symobol: "N", image: "assets/asn.PNG"),
    ResiduoModel(name: "Arg", symobol: "R", image: "assets/arg.PNG"),
    ResiduoModel(name: "His", symobol: "H", image: "assets/his.PNG"),
    ResiduoModel(name: "Leu", symobol: "L", image: "assets/leu.PNG"),
    ResiduoModel(name: "Iso", symobol: "I", image: "assets/iso.PNG"),
    ResiduoModel(name: "Phe", symobol: "F", image: "assets/phe.PNG"),
    ResiduoModel(name: "Glu", symobol: "E", image: "assets/glu.PNG"),
    ResiduoModel(name: "Gly", symobol: "G", image: "assets/gly.PNG"),
    ResiduoModel(name: "Lys", symobol: "K", image: "assets/lys.PNG"),
    ResiduoModel(name: "Pro", symobol: "P", image: "assets/pro.PNG"),
    ResiduoModel(name: "Met", symobol: "M", image: "assets/met.PNG"),
    ResiduoModel(name: "Trp", symobol: "W", image: "assets/trp.PNG"),
    ResiduoModel(name: "Ser", symobol: "S", image: "assets/ser.PNG"),
    ResiduoModel(name: "Tyr", symobol: "Y", image: "assets/tyr.PNG"),
    ResiduoModel(name: "Val", symobol: "V", image: "assets/val.PNG"),
  ].obs;


  void decIndex() {
    if (index.value > 0) {
      index.value --;
    }
    update();
  }

  void incIndex() {
    if (index.value < 17) {
      index.value ++;
    }
    update();
  }

  void SetTipoMassa(String tipo) {
    tipoMassa.value = tipo;
    update();
  }

  double GetMassaMolar() {
    return double.parse(sinteseModel!.residuoAAModel!.massaMolarProtegido!);
  }

  void setLoading(bool value){
    loading.value = value;
    update();
  }

  Future<void> saveProtocolo({Function? onFail, Function? onSucess}) async {
    setLoading(true);
    await controller.getUser();

    sinteseModel!.user = controller.user;

    try {
      await sinteseModel!.saveData();
      onSucess!();

    } on PlatformException catch (e) {
      onFail!(e.toString());
    }


    setLoading(false);
  }
}