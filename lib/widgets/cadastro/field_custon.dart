import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FieldCuston extends StatelessWidget {
  FieldCuston({Key? key, this.largura, this.onSaved, this.textInputType = TextInputType.text, this.onChanged, this.onValidade, this.textEditingController, this.linhas = 1, this.readOnly = false}) : super(key: key);

  final double? largura;
  final Function(String?)? onSaved;
  final TextInputType? textInputType;
  final Function(String?)? onChanged;
  final String? Function(String?)? onValidade;
  final TextEditingController? textEditingController;
  final int linhas;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: largura,
      height: 30 ,
      color: readOnly ? Colors.brown[100] : Colors.white,
      child: TextFormField(
        maxLines: linhas,
        controller: textEditingController,
        onSaved: onSaved,
        keyboardType: textInputType,
        onChanged: onChanged,
        validator: onValidade,
      ),
    );
  }
}
