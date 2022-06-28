import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/model/sintese_model.dart';
import 'package:meu_diario_de_sintese/pages/login.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_nota.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_new_note.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final SinteseController _controller = SinteseController();
  List<SinteseModel>? sinteses = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            FutureBuilder<List<SinteseModel>>(
                future: _controller.getSintese(),
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
                        Text("Obtendo sínteses", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          height: 10,
                        ),
                      ],),);
                  }

                  if(snapshot.hasError) {
                    return const Center(child: Text("Erro ao obter sínteses..."),);
                  }

                  sinteses = snapshot.data;

                  return ListView.builder(
                      itemCount: sinteses!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return ItemNota(sintese: sinteses![i]);
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
                  showDialog(
                      context: context,
                      builder: (context) {
                        SinteseController _controller = SinteseController();

                        _controller.NovaSintese();
                        return WidgetNewNote();
                      });
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: AppTheme.colorAppBar,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        ))),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppTheme.colorBackgroudDialog,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20.0))
                          ),
                          title: const Text("Deseja realmente sair?", style: TextStyle(color: Colors.white)),
                          actions: <Widget>[
                            FlatButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Não", style: TextStyle(color: Colors.white),)),
                            FlatButton(
                                onPressed: () {
                                  Get.offAll(Login());
                                },
                                child: const Text("Sim", style: TextStyle(color: Colors.white),))
                          ],
                        );
                      });
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                        child: Icon(
                          Icons.exit_to_app_rounded,
                          size: 50,
                          color: Colors.white,
                        ))),
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