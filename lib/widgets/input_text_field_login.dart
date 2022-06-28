import 'package:flutter/material.dart';

class InputTextFieldLogin extends StatelessWidget {

  InputTextFieldLogin({@required this.hintText, @required this.obscureText, @required this.onSaved, @required this.onValidate});

  final String? hintText;
  final bool? obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? onValidate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Center(
        child: TextFormField(
          obscureText: obscureText!,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              focusColor: Colors.white,
              fillColor: Colors.white,
              hoverColor: Colors.white,
              hintStyle: const TextStyle(
                  color: Colors.white
              )
          ),
          onSaved: onSaved,
          validator: onValidate,
        ),
      ),
    );
  }
}
