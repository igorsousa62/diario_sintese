import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_diario_de_sintese/widgets/label_text.dart';

class TextFormFieldCuston extends StatelessWidget {
  final String? hint;
  final TextAlign? textAlign;
  final String? text;
  final bool? padding;
  final bool? isPassword;
  final Function(String?)? onSaved;
  final String? Function(String?)? onValidate;
  final TextEditingController? controller;
  final bool? autoFocus;
  final TextInputType? textInputType;
  final TextInputFormatter? textInputFormatter;

  TextFormFieldCuston({this.hint, this.textAlign, this.text, this.padding = false, this.onSaved, this.onValidate, this.isPassword = false, this.controller, this.autoFocus = false, this.textInputType, this.textInputFormatter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding! ? MediaQuery.of(context).size.width * 0.08 : 0, right: padding! ? MediaQuery.of(context).size.width * 0.08 : 0 ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          text! == "" ? Container() : LabelText(text!, true),
          TextFormField(
            inputFormatters: textInputFormatter == null ? [] : [textInputFormatter!],
            keyboardType: textInputType,
            controller: controller,
            autofocus: autoFocus!,
            textAlign: textAlign!,
            obscureText: isPassword!,
            onSaved: onSaved,
            validator: onValidate,
            decoration: InputDecoration(
              hintText: hint,
            ),
          ),
        ],
      )
    );
  }
}
