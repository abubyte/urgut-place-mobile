import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_state.dart';
import 'package:urgut_please/features/authentication/views/register/widgets/register_form.dart';
import 'package:urgut_please/shared/models/user/user_model.dart';
import 'package:urgut_please/shared/widgets/authentication_navigate_button.dart';
import 'package:urgut_please/shared/widgets/submit_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Space
                      70.h,

                      // Register Form
                      RegisterForm(
                        formKey: _registerFormKey,
                        firstnameController: _firstnameController,
                        lastnameController: _lastnameController,
                        loginController: _loginController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                      ),
                      12.h,

                      // Navigate Button
                      AuthenticationNavigateButton(
                        onPressed: () => context.push(Routes.login),
                        buttonText: "Hisobingiz bormi?",
                      ),
                    ],
                  ),
                ),
              ),

              // Submit Button
              10.h,
              BlocBuilder<RegisterBloc, RegisterState>(
                builder: (context, state) {
                  bool loading = state.status == RegisterStatus.loading;
                  if (state.status == RegisterStatus.success) {
                    ToastUi.showToast(message: "Hisob yaratildi!");
                    context.pushReplacement(
                      Routes.verify,
                      extra: {'login': _loginController.text.trim(), 'password': _passwordController.text.trim()},
                    );
                  } else if (state.status == RegisterStatus.failure) {
                    ToastUi.showError(message: state.errorMessage ?? "Hisob yaratib bo'lmadi");
                  }

                  if (state.status == RegisterStatus.loading) {
                    ToastUi.showToast(message: "Hisob yaratilmoqda...");
                    return SubmitButton(onPressed: null, loading: true);
                  } else {
                    return SubmitButton(
                      loading: loading,
                      onPressed: loading
                          ? null
                          : () {
                              if (_registerFormKey.currentState!.validate()) {
                                context.read<RegisterBloc>().add(
                                  RegisterRequested(
                                    UserCreateDto(
                                      firstname: _firstnameController.text.trim(),
                                      lastname: _lastnameController.text.trim(),
                                      login: _loginController.text.trim(),
                                      password: _passwordController.text.trim(),
                                    ),
                                  ),
                                );
                              } else {
                                ToastUi.showError(message: "Iltimos ma'lumotlarni to'liq kiriting");
                              }
                            },
                    );
                  }
                },
              ),
              16.h,
            ],
          ),
        ),
      ),
    );
  }
}
