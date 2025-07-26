import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urgut_please/config/di/injection.dart';
import 'package:urgut_please/core/services/authentication_service.dart';
import 'package:urgut_please/core/services/user_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_event.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService _userService;

  ProfileBloc(this._userService) : super(ProfileState()) {
    on<GetProfile>(_onGetProfile);
    on<LogoutRequested>(_onLogoutRequested);

    add(GetProfile());
  }

  Future<void> _onGetProfile(GetProfile event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final user = await _userService.getMe();

      emit(state.copyWith(status: ProfileStatus.success, currentUser: user));
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: ProfileStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      await getIt<AuthenticationService>().logout();

      emit(state.copyWith(status: ProfileStatus.success, currentUser: null));
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: ProfileStatus.failure, errorMessage: e.toString()));
    }
  }
}
