import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class AuthenticationInputField extends StatefulWidget {
  const AuthenticationInputField({
    super.key,
    this.obscure = false,
    this.validator,
    required this.label,
    required this.controller,
  });

  final bool obscure;
  final String? Function(String? value)? validator;
  final String label;
  final TextEditingController controller;

  @override
  State<AuthenticationInputField> createState() => _AuthenticationInputFieldState();
}

class _AuthenticationInputFieldState extends State<AuthenticationInputField> {
  bool _obscure = true;
  final underline = UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFF2F2F2), width: 1));

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscure ? _obscure : false,
      validator: widget.validator,
      controller: widget.controller,
      style: TextStyle(color: Color(0xFF816246), fontSize: 16, fontWeight: FontWeight.w600),
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(color: Color(0xff787878), fontSize: 14, fontWeight: FontWeight.w400),
        enabledBorder: underline,
        focusedBorder: underline,
        errorBorder: underline,
        disabledBorder: underline,
        focusedErrorBorder: underline,
        suffixIcon: widget.controller.text.trim().isNotEmpty
            ? widget.obscure
                  ? IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: _obscure ? Icon(Feather.eye_off) : Icon(Feather.eye),
                    )
                  : null
            : null,
        iconColor: Colors.white,
      ),
    );
  }
}
