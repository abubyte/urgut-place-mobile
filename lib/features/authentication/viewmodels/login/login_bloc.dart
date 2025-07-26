import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService _authenticationService;

  LoginBloc(this._authenticationService) : super(const LoginState()) {
    on<LoginRequested>(_onLoginRequested);
  }

  final loginFormKey = GlobalKey<FormState>();

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  Future _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    try {
      await _authenticationService.login(event.login, event.password);
      emit(state.copyWith(status: LoginStatus.success));
    } catch (e) {
      // ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: LoginStatus.failure, errorMessage: e.toString().substring(11)));
    }
  }

  void onSubmit() {
    if (loginFormKey.currentState!.validate()) {
      ToastUi.showToast(message: "Hisobingizga kirilmoqda...");

      add(LoginRequested(loginController.text.trim(), passwordController.text.trim()));
    } else {
      ToastUi.showError(message: "Iltimos ma'lumotlarni kiriting");
    }
  }
}
