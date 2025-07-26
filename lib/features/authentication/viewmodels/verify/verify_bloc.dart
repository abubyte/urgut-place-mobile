import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final AuthenticationService _authenticationService;
  Timer? _timer;

  VerifyBloc(this._authenticationService) : super(const VerifyState()) {
    on<SendVerificationRequested>(_onSendVerificationRequested);
    on<VerifyRequested>(_onVerifyRequested);
    on<ResendTimerTick>(_onResendTimerTick);
    on<ResetTimer>(_onResetTimer);
  }

  Future _onSendVerificationRequested(SendVerificationRequested event, Emitter<VerifyState> emit) async {
    emit(state.copyWith(status: VerifyStatus.loading));
    try {
      await _authenticationService.sendVerification(event.login);
      emit(
        state.copyWith(
          status: VerifyStatus.codeSent,
          resendTimer: 120,
          canResend: false,
        ),
      );
      _startTimer();
      ToastUi.showToast(message: "Tasdiqlash kodi yuborildi");
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: VerifyStatus.failure, errorMessage: e.toString()));
    }
  }

  Future _onVerifyRequested(VerifyRequested event, Emitter<VerifyState> emit) async {
    emit(state.copyWith(status: VerifyStatus.loading));
    try {
      await _authenticationService.verify(event.login, event.verificationCode);
      emit(state.copyWith(status: VerifyStatus.success));
      _timer?.cancel();
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: VerifyStatus.failure, errorMessage: e.toString()));
    }
  }

  void _onResendTimerTick(ResendTimerTick event, Emitter<VerifyState> emit) {
    if (event.remainingSeconds > 0) {
      emit(state.copyWith(resendTimer: event.remainingSeconds));
    } else {
      emit(state.copyWith(resendTimer: 0, canResend: true));
      _timer?.cancel();
    }
  }

  void _onResetTimer(ResetTimer event, Emitter<VerifyState> emit) {
    emit(state.copyWith(resendTimer: 0, canResend: true));
    _timer?.cancel();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remaining = 120 - timer.tick;
      if (remaining <= 0) {
        add(const ResendTimerTick(0));
        timer.cancel();
      } else {
        add(ResendTimerTick(remaining));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
