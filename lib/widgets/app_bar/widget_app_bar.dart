import 'package:flutter/material.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_menu_main.dart';

class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: AppTheme.colorAppBar,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          height: MediaQuery.of(context).size.height * 0.11,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/appbar.png", height: MediaQuery.of(context).size.height * 0.1, fit: BoxFit.cover),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: const Icon(Icons.menu_outlined,
                      color: Colors.white, size: 50),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const WidgetMenuMain();
                        });
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
