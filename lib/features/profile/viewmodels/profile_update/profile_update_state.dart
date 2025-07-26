import 'dart:io';

enum ProfileUpdateStatus { initial, loading, success, failure }

class ProfileUpdateState {
  final ProfileUpdateStatus status;
  final String? errorMessage;
  final String firstName;
  final String lastName;
  final String? avatarUrl;
  final File? selectedAvatarFile;
  final bool hasChanges;

  const ProfileUpdateState({
    this.status = ProfileUpdateStatus.initial,
    this.errorMessage,
    this.firstName = '',
    this.lastName = '',
    this.avatarUrl,
    this.selectedAvatarFile,
    this.hasChanges = false,
  });

  ProfileUpdateState copyWith({
    ProfileUpdateStatus? status,
    String? errorMessage,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    File? selectedAvatarFile,
    bool? hasChanges,
    bool clearSelectedAvatar = false,
  }) {
    return ProfileUpdateState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      selectedAvatarFile: clearSelectedAvatar ? null : (selectedAvatarFile ?? this.selectedAvatarFile),
      hasChanges: hasChanges ?? this.hasChanges,
    );
  }
}
