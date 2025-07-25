import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_state.dart';
import 'package:urgut_please/features/authentication/views/login/widgets/login_form.dart';
import 'package:urgut_please/shared/widgets/authentication_navigate_button.dart';
import 'package:urgut_please/shared/widgets/submit_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _verificationCodeController = TextEditingController();

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Space
                      70.h,

                      // Code input
                      LoginForm(
                        formKey: _loginFormKey,
                        loginController: _loginController,
                        passwordController: _verificationCodeController,
                      ),
                      12.h,

                      // Navigate Button
                      AuthenticationNavigateButton(
                        onPressed: () => context.push(Routes.register),
                        buttonText: "Hisobingiz yo'qmi?",
                      ),
                    ],
                  ),
                ),
              ),

              // Submit Button
              10.h,
              BlocBuilder<VerifyBloc, VerifyState>(
                builder: (context, state) {
                  bool loading = state.status == VerifyStatus.loading;
                  if (state.status == VerifyStatus.success) {
                    ToastUi.showToast(message: "Hisobingiz muvoffaqiyatli tasdiqlandi!");
                    context.pushReplacement(Routes.home);
                  } else if (state.status == VerifyStatus.failure) {
                    ToastUi.showError(message: "Hisobni tasdiqlab bo'lmadi");
                  }

                  if (state.status == VerifyStatus.loading) {
                    return SubmitButton(onPressed: null, loading: true);
                  } else {
                    return SubmitButton(
                      loading: loading,
                      onPressed: loading
                          ? null
                          : () {
                              if (_loginFormKey.currentState!.validate()) {
                                ToastUi.showToast(message: "Hisobingiz tasdiqlanmoqda...");

                                context.read<VerifyBloc>().add(
                                  VerifyRequested(
                                    _loginController.text.trim(),
                                    _verificationCodeController.text.trim(),
                                  ),
                                );
                              } else {
                                ToastUi.showError(message: "Iltimos ma'lumotlarni kiriting");
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
