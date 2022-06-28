import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/controller/residuo_aa_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/model/residuo_aa_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_aas.dart';

class ListAAS extends StatelessWidget {
  ListAAS({Key? key, required this.tipo}) : super(key: key);

  final ResiduoAAController _controller = ResiduoAAController();
  List<ResiduoAAModel>? residuos;
  String? tipo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            Center(
              child: WidgetTitle(title: "Catálogo de AAS"),
            ),
            const SizedBox(height: 20,),
            FutureBuilder<List<ResiduoAAModel>>(
                future: _controller.aaByTipo(tipo!),
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
                        Text("Obtendo resíduos", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 10,
                        ),
                      ],),);
                  }

                  if(snapshot.hasError) {
                    return const Center(child: Text("Erro ao obter protocolos..."),);
                  }

                  residuos = snapshot.data;

                  return ListView.builder(
                      itemCount: residuos!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                            onTap: () {
                              if (tipo != '') {
                                PreparoSinteseController _controllerPreparo = Get.put(PreparoSinteseController());

                                _controllerPreparo.residuoAASelected.value = true;
                                
                                SinteseController _controller = Get.put(SinteseController());

                                _controller.sinteseModel!.residuoAAModel = residuos![i];
                                Get.back();
                              }
                            },
                            child: ItemAAS(residuoAA: residuos![i],));
                      });
                })
          ],
        ),
      ),
    );
  }
}