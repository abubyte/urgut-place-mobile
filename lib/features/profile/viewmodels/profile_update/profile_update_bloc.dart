import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urgut_please/core/services/user_service.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_event.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final UserService _profileService;
  final ImagePicker _imagePicker = ImagePicker();

  ProfileUpdateBloc(this._profileService) : super(const ProfileUpdateState()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<PickAvatarFromGallery>(_onPickAvatarFromGallery);
    on<PickAvatarFromCamera>(_onPickAvatarFromCamera);
    on<RemoveAvatar>(_onRemoveAvatar);
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(status: ProfileUpdateStatus.loading));
    try {
      final userProfile = await _profileService.getMe();
      emit(
        state.copyWith(
          status: ProfileUpdateStatus.initial,
          firstName: userProfile.firstname,
          lastName: userProfile.lastname,
          avatarUrl: userProfile.imageUrl,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileUpdateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onUpdateProfile(UpdateProfile event, Emitter<ProfileUpdateState> emit) async {
    emit(state.copyWith(status: ProfileUpdateStatus.loading));
    try {
      await _profileService.updateUser(firstname: event.firstName, lastname: event.lastName, image: event.avatarFile);

      emit(
        state.copyWith(
          status: ProfileUpdateStatus.success,
          firstName: event.firstName,
          lastName: event.lastName,
          hasChanges: false,
          clearSelectedAvatar: true,
        ),
      );

      ToastUi.showToast(message: "Profil muvaffaqiyatli yangilandi");
    } catch (e) {
      ToastUi.showError(message: e.toString());
      emit(state.copyWith(status: ProfileUpdateStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onPickAvatarFromGallery(PickAvatarFromGallery event, Emitter<ProfileUpdateState> emit) async {
    await _pickImage(ImageSource.gallery, emit);
  }

  Future<void> _onPickAvatarFromCamera(PickAvatarFromCamera event, Emitter<ProfileUpdateState> emit) async {
    await _pickImage(ImageSource.camera, emit);
  }

  Future<void> _pickImage(ImageSource source, Emitter<ProfileUpdateState> emit) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
        requestFullMetadata: false,
      );

      if (image != null) {
        // Verify the file exists and is readable
        final file = File(image.path);
        if (await file.exists()) {
          emit(state.copyWith(selectedAvatarFile: file, hasChanges: true));
        } else {
          ToastUi.showError(message: "Tanlangan rasm topilmadi");
        }
      }
    } catch (e) {
      // Handle specific platform exceptions
      if (e.toString().contains('PlatformException')) {
        if (e.toString().contains('camera_access_denied')) {
          ToastUi.showError(message: "Kameraga ruxsat berilmagan. Sozlamalardan ruxsat bering");
        } else if (e.toString().contains('photo_access_denied')) {
          ToastUi.showError(message: "Galereyaga ruxsat berilmagan. Sozlamalardan ruxsat bering");
        } else {
          ToastUi.showError(message: "Rasm tanlash imkonsiz. Ilovaga ruxsat berilganini tekshiring");
        }
      } else if (e.toString().contains('channel-error')) {
        ToastUi.showError(message: "Rasm tanlash xizmati mavjud emas");
      } else {
        ToastUi.showError(message: "Rasm tanlashda xatolik yuz berdi");
      }
    }
  }

  void _onRemoveAvatar(RemoveAvatar event, Emitter<ProfileUpdateState> emit) {
    emit(state.copyWith(clearSelectedAvatar: true, avatarUrl: null, hasChanges: true));
  }

  void updateFields(String firstName, String lastName) {
    final hasChanges = firstName != state.firstName || lastName != state.lastName || state.selectedAvatarFile != null;

    emit(state.copyWith(firstName: firstName, lastName: lastName, hasChanges: hasChanges));
  }
}
