import 'dart:io';

abstract class ProfileUpdateEvent {
  const ProfileUpdateEvent();
}

class LoadUserProfile extends ProfileUpdateEvent {
  const LoadUserProfile();
}

class UpdateProfile extends ProfileUpdateEvent {
  final String firstName;
  final String lastName;
  final File? avatarFile;

  const UpdateProfile({required this.firstName, required this.lastName, this.avatarFile});
}

class PickAvatarFromGallery extends ProfileUpdateEvent {
  const PickAvatarFromGallery();
}

class PickAvatarFromCamera extends ProfileUpdateEvent {
  const PickAvatarFromCamera();
}

class RemoveAvatar extends ProfileUpdateEvent {
  const RemoveAvatar();
}
