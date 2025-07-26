import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_state.dart';
import 'package:urgut_please/features/authentication/views/login/widgets/login_form.dart';
import 'package:urgut_please/shared/widgets/authentication_navigate_button.dart';
import 'package:urgut_please/shared/widgets/submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<LoginBloc>();

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Space
                      200.h,

                      // Login Form
                      LoginForm(
                        formKey: viewmodel.loginFormKey,
                        loginController: viewmodel.loginController,
                        passwordController: viewmodel.passwordController,
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
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.status == LoginStatus.success) {
                    ToastUi.showToast(message: "Hisobingizga muvoffaqiyatli kirildi!");
                    context.go(Routes.home);
                  } else if (state.status == LoginStatus.failure) {
                    ToastUi.showError(message: state.errorMessage ?? "Hisobga kirib bo'lmadi");
                  }
                },
                builder: (context, state) {
                  bool loading = state.status == LoginStatus.loading;
                  return SubmitButton(loading: loading, onPressed: loading ? null : viewmodel.onSubmit);
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
