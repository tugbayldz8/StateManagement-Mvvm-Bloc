import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});

  final TextEditingController? controller;
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isSecure = true;

  void _changeLoaidng() {
    setState(() {
      _isSecure != _isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.phone,
      obscureText: _isSecure,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: 'Password',
        suffix: IconButton(
          onPressed: () {
            _changeLoaidng();
          },
          icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
        ),
        //Icon(Icons.visibility), //göz işaretiiii
      ),
    );
  }
}
