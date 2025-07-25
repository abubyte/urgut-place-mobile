import 'package:flutter/material.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/validators.dart';
import 'package:urgut_please/shared/widgets/authentication_input_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.formKey,
    required this.firstnameController,
    required this.lastnameController,
    required this.loginController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;

  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Row(
            children: [
              AuthenticationInputField(
                label: "Ism",
                validator: TextValidator.validator,
                controller: firstnameController,
              ),
              10.w,
              AuthenticationInputField(
                label: "Familya",
                validator: TextValidator.validator,
                controller: lastnameController,
              ),
            ],
          ),
          10.h,
          AuthenticationInputField(label: "Login", validator: LoginValidator.validator, controller: loginController),
          10.h,
          AuthenticationInputField(
            label: "Parol",
            validator: PasswordValidator.validator,
            controller: passwordController,
            obscure: true,
          ),
          10.h,
          AuthenticationInputField(
            label: "Parolni tasdiqlash",
            validator: (value) => ConfirmPasswordValidator.validator(value, passwordController.text.trim()),
            controller: confirmPasswordController,
            obscure: true,
          ),
        ],
      ),
    );
  }
}
