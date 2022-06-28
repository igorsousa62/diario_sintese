import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/novo_protocolo.dart';
import 'package:meu_diario_de_sintese/pages/residuoAA/list_aas.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_protocolo.dart';
import 'package:meu_diario_de_sintese/pages/resina/list_resinas.dart';
import 'package:meu_diario_de_sintese/pages/resina/nova_resina.dart';
import 'package:meu_diario_de_sintese/pages/residuoAA/novo_residuo_aas.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/widget_catologo_cadastrar.dart';

class WidgetMenuMain extends StatelessWidget {
  const WidgetMenuMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Column(
        children: [
          ButtonCuston(
            onTap: () {
              Get.back();
            },
            text: "Diário do Lab.",
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonCuston(
            onTap: () {
              Get.back();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppTheme.colorBackgroudDialog,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      title: Column(
                        children: [
                          ButtonCuston(
                            onTap: () {
                              Get.back();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WidgetCatalogoCadastrar(
                                      onCadastrar: () {
                                        Get.back();
                                        Get.to(NovaResina());
                                      },
                                      onCatalogo: () {
                                        Get.back();
                                        Get.to(ListResina(sintese: false,));
                                      },
                                    );
                                  });
                            },
                            text: "Resina",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonCuston(
                            onTap: () {
                              Get.back();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WidgetCatalogoCadastrar(
                                      onCadastrar: () {
                                        Get.back();
                                        Get.to(NovoResiduoAA());
                                      },
                                      onCatalogo: () {
                                        Get.back();
                                        Get.to(ListAAS(tipo: '',));
                                      },
                                    );
                                  });
                            },
                            text: "Resíduo de aa",
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              "Fechar",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    );
                  });
            },
            text: "Materiais de Síntese",
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonCuston(
            onTap: () {
              Get.back();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: AppTheme.colorBackgroudDialog,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      title: Column(
                        children: [
                          ButtonCuston(
                            onTap: () {
                              Get.back();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WidgetCatalogoCadastrar(
                                      onCadastrar: () {
                                        Get.back();
                                        Get.to(NovoProtocolo(tipo: "Desproteção",));
                                      },
                                      onCatalogo: () {
                                        Get.back();
                                        Get.to(ListCatalogos(tipo: "Desproteção", sintese: false,));
                                      },
                                    );
                                  });
                            },
                            text: "Desproteção",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonCuston(
                            onTap: () {
                              Get.back();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WidgetCatalogoCadastrar(
                                      onCadastrar: () {
                                        Get.back();
                                        Get.to(NovoProtocolo(tipo: "Acoplamento",));
                                      },
                                      onCatalogo: () {
                                        Get.back();
                                        Get.to(ListCatalogos(tipo: "Acoplamento", sintese: false));
                                      },
                                    );
                                  });
                            },
                            text: "Acoplamento",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonCuston(
                            onTap: () {
                              Get.back();
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return WidgetCatalogoCadastrar(
                                      onCadastrar: () {
                                        Get.back();
                                        Get.to(NovoProtocolo(tipo: "Clivagem",));
                                      },
                                      onCatalogo: () {
                                        Get.back();
                                        Get.to(ListCatalogos(tipo: "Clivagem", sintese: false));
                                      },
                                    );
                                  });
                            },
                            text: "Clivagem",
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              "Fechar",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    );
                  });
            },
            text: "Protocolos",
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Fechar",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
