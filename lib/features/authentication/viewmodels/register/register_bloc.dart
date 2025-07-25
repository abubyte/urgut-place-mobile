import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthenticationService _authenticationService;

  RegisterBloc(this._authenticationService) : super(const RegisterState()) {
    on<RegisterRequested>(_onRegisterRequested);
  }

  Future _onRegisterRequested(RegisterRequested event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    try {
      await _authenticationService.register(event.data);
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e) {
      emit(state.copyWith(status: RegisterStatus.failure));

      ToastUi.showError(message: e.toString());
    }
  }
}
