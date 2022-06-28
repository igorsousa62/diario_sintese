import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/controller/resina_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/model/resina_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_resina.dart';

class ListResina extends StatelessWidget {
  ListResina({Key? key, required this.sintese}) : super(key: key);

  final ResinaController _controller = ResinaController();
  List<ResinaModel>? resinas;
  bool sintese;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            const Center(
              child: Text("Catálogo de Resinas", style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            const SizedBox(height: 20,),
            FutureBuilder<List<ResinaModel>>(
                future: _controller.getResinas(),
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
                        Text("Obtendo resinas", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 10,
                        ),
                      ],),);
                  }

                  if(snapshot.hasError) {
                    return const Center(child: Text("Erro ao obter resinas..."),);
                  }

                  resinas = snapshot.data;

                  return ListView.builder(
                      itemCount: resinas!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                            onTap: () {
                              if (sintese) {
                                SinteseController _controller = Get.put(SinteseController());
                                PreparoSinteseController _controllerPreparo = Get.put(PreparoSinteseController());

                                _controllerPreparo.setResina(true);
                                _controller.sinteseModel!.resinaModel = resinas![i];
                                Get.back();
                              }
                            },
                            child: ItemResina(resina: resinas![i],));
                      });
                })
          ],
        ),
      ),
    );
  }
}