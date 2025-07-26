import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_bloc.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_event.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_bloc.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_event.dart';
import 'package:urgut_please/features/profile/viewmodels/profile_update/profile_update_state.dart';
import 'package:urgut_please/shared/widgets/submit_button.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileUpdateBloc>().add(const LoadUserProfile());
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _showAvatarOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
            ),
            20.h,
            const Text("Avatar tanlash", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            20.h,
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.blue),
              title: const Text("Galereyadan tanlash"),
              onTap: () {
                Navigator.pop(context);
                context.read<ProfileUpdateBloc>().add(const PickAvatarFromGallery());
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.green),
              title: const Text("Kameradan olish"),
              onTap: () {
                Navigator.pop(context);
                context.read<ProfileUpdateBloc>().add(const PickAvatarFromCamera());
              },
            ),
            BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
              builder: (context, state) {
                if (state.avatarUrl != null || state.selectedAvatarFile != null) {
                  return ListTile(
                    leading: const Icon(Icons.delete, color: Colors.red),
                    title: const Text("Avatarni o'chirish"),
                    onTap: () {
                      Navigator.pop(context);
                      context.read<ProfileUpdateBloc>().add(const RemoveAvatar());
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            20.h,
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(ProfileUpdateState state) {
    return Center(
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => _showAvatarOptions(context),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(color: Colors.grey[300]!, width: 2),
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(60), child: _getAvatarWidget(state)),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => _showAvatarOptions(context),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getAvatarWidget(ProfileUpdateState state) {
    if (state.selectedAvatarFile != null) {
      return Image.file(state.selectedAvatarFile!, fit: BoxFit.cover, width: 120, height: 120);
    } else if (state.avatarUrl != null && state.avatarUrl!.isNotEmpty) {
      return Image.network(
        state.avatarUrl!,
        fit: BoxFit.cover,
        width: 120,
        height: 120,
        errorBuilder: (context, error, stackTrace) {
          return _getDefaultAvatar();
        },
      );
    } else {
      return _getDefaultAvatar();
    }
  }

  Widget _getDefaultAvatar() {
    return Container(
      width: 120,
      height: 120,
      color: Colors.grey[100],
      child: Icon(Icons.person, size: 60, color: Colors.grey[400]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Profilni tahrirlash"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
            builder: (context, state) {
              if (state.hasChanges) {
                return TextButton(
                  onPressed: () {
                    _firstNameController.text = state.firstName;
                    _lastNameController.text = state.lastName;
                    context.read<ProfileUpdateBloc>().add(const LoadUserProfile());
                  },
                  child: const Text("Bekor qilish", style: TextStyle(color: Colors.red)),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocListener<ProfileUpdateBloc, ProfileUpdateState>(
        listener: (context, state) {
          if (state.status == ProfileUpdateStatus.success) {
            context.read<ProfileBloc>().add(GetProfile());
            context.pop();
          }
        },
        child: BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
          builder: (context, state) {
            if (state.status == ProfileUpdateStatus.loading && state.firstName.isEmpty && state.lastName.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            // Update controllers when data is loaded
            if (_firstNameController.text != state.firstName) {
              _firstNameController.text = state.firstName;
            }
            if (_lastNameController.text != state.lastName) {
              _lastNameController.text = state.lastName;
            }

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.h,

                              // Avatar Section
                              _buildAvatarSection(state),

                              40.h,

                              // First Name Field
                              const Text(
                                "Ism",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                              ),
                              8.h,
                              TextFormField(
                                controller: _firstNameController,
                                decoration: InputDecoration(
                                  hintText: "Ismingizni kiriting",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Colors.red),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Ism majburiy';
                                  }
                                  if (value.trim().length < 2) {
                                    return 'Ism kamida 2 ta belgidan iborat bo\'lishi kerak';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  context.read<ProfileUpdateBloc>().updateFields(value, _lastNameController.text);
                                },
                              ),

                              20.h,

                              // Last Name Field
                              const Text(
                                "Familiya",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                              ),
                              8.h,
                              TextFormField(
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  hintText: "Familiyangizni kiriting",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.grey[300]!),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Colors.blue),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: Colors.red),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                ),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Familiya majburiy';
                                  }
                                  if (value.trim().length < 2) {
                                    return 'Familiya kamida 2 ta belgidan iborat bo\'lishi kerak';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  context.read<ProfileUpdateBloc>().updateFields(_firstNameController.text, value);
                                },
                              ),

                              // Error Display
                              if (state.status == ProfileUpdateStatus.failure && state.errorMessage != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.red.withOpacity(0.3)),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.error_outline, color: Colors.red[700], size: 20),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            state.errorMessage!,
                                            style: TextStyle(color: Colors.red[700], fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Save Button
                    SubmitButton(
                      loading: state.status == ProfileUpdateStatus.loading,
                      onPressed: (!state.hasChanges || state.status == ProfileUpdateStatus.loading)
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<ProfileUpdateBloc>().add(
                                  UpdateProfile(
                                    firstName: _firstNameController.text.trim(),
                                    lastName: _lastNameController.text.trim(),
                                    avatarFile: state.selectedAvatarFile,
                                  ),
                                );
                              }
                            },
                    ),

                    16.h,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
