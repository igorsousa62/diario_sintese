import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/protocolo_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_protocolo.dart';

class ListCatalogos extends StatelessWidget {
  ListCatalogos({Key? key, required this.tipo, required this.sintese}) : super(key: key);
  ProtocoloController controller = ProtocoloController();
  List<ProtocoloModel>? protocolos;

  String? tipo;
  bool? sintese;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            Center(
              child: WidgetTitle(title: "Protocolos " + tipo!,)
            ),
            const SizedBox(height: 20,),
            FutureBuilder<List<ProtocoloModel>>(
              future: controller.getProtocolos(tipo!),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Obtendo protocolos", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 10,
                        ),
                      ],),);
                  }

                  if(snapshot.hasError) {
                    return const Center(child: Text("Erro ao obter protocolos..."),);
                  }

                  protocolos = snapshot.data;

                  return ListView.builder(
                      itemCount: protocolos!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                            onTap: () {
                              if (sintese!) {
                                SinteseController _controller = Get.put(SinteseController());

                                if (tipo == "Desproteção") {
                                  _controller.sinteseModel!.desprotecao = protocolos![i];
                                } else if (tipo == "Acoplamento") {
                                  _controller.sinteseModel!.acoplamento = protocolos![i];
                                } else if (tipo == "Clivagem") {
                                  _controller.sinteseModel!.clivagem = protocolos![i];
                                }

                                Get.back();
                              }
                            },
                            child: ItemProtocolo(protocoloModel: protocolos![i],));
                      });
                })
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAll(HomePage());
                },
                child: Container(
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: AppTheme.colorAppBar,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                        child: Text("Voltar a tela inicial", style: TextStyle(fontSize: 18, color: Colors.white),))),
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: AppTheme.colorAppBar,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Center(
                      child: Icon(
                        Icons.info_rounded,
                        size: 50,
                        color: Colors.white,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}