import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthenticationService _authenticationService;

  VerifyBloc(this._authenticationService) : super(const VerifyState()) {
    on<VerifyRequested>(_onVerifyRequested);
  }

  Future _onVerifyRequested(VerifyRequested event, Emitter<VerifyState> emit) async {
    emit(state.copyWith(status: VerifyStatus.loading));
    try {
      await _authenticationService.verify(event.login, event.verificationCode);
      emit(state.copyWith(status: VerifyStatus.success));
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: VerifyStatus.failure));
    }
  }
}
