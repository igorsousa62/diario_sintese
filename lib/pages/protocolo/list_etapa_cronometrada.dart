import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_cronometrada.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_etapa_cronometrada.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class ListEtapaCronometrada extends StatefulWidget {
  ListEtapaCronometrada({Key? key, this.protocoloModel}) : super(key: key);

  ProtocoloModel? protocoloModel;

  @override
  _ListEtapaCronometradaState createState() => _ListEtapaCronometradaState();
}

class _ListEtapaCronometradaState extends State<ListEtapaCronometrada> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            Center(child: WidgetTitle(title: "Etapa Cronometrada")),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                itemCount: widget.protocoloModel!.etapaCronometrada!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return ItemEtapaCronometrada(
                      onTapDelete: () {
                        widget.protocoloModel!.etapaCronometrada!.remove(widget.protocoloModel!.etapaCronometrada![i]);
                        showToast("Etapa removida com sucesso");
                        Get.back();
                        setState(() {

                        });
                      },
                      onTapEdit: () {
                        Get.to(EtapaCronometrada(protocoloModel: widget.protocoloModel, etapaCronometrada: widget.protocoloModel!.etapaCronometrada![i]));
                      },
                      etapa: widget.protocoloModel!.etapaCronometrada![i], protocoloModel: widget.protocoloModel);
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
                        child: Text(
                          "Voltar a tela inicial",
                          style: TextStyle(fontSize: 18, color: Colors.white),
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

