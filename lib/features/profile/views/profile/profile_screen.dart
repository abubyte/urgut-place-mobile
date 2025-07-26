import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_bloc.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_event.dart';
import 'package:urgut_please/features/profile/viewmodels/profile/profile_state.dart';
import 'package:urgut_please/features/profile/views/profile/profile_update_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            // Handle navigation after logout
            if (state.status == ProfileStatus.success && state.currentUser == null) {
              // Use post frame callback to ensure navigation happens after build
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(Routes.login);
              });
            }
          },
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.status == ProfileStatus.loading) {
                return Center(child: CircularProgressIndicator());
              } else if (state.status == ProfileStatus.success && state.currentUser != null) {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        width: double.maxFinite,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image: state.currentUser!.imageUrl != null
                                          ? NetworkImage(state.currentUser!.imageUrl!) as ImageProvider
                                          : AssetImage('assets/icons/user.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${state.currentUser!.firstname} ${state.currentUser!.lastname}',
                                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      state.currentUser!.login,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () => Navigator.of(
                                context,
                              ).push(MaterialPageRoute(builder: (context) => ProfileUpdateScreen())),
                              icon: Icon(Icons.chevron_right, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),

                      // Menu Items
                      _buildMenuItem(
                        icon: Icons.message_outlined,
                        title: "Qo'llab quvvatlash",
                        onTap: () {
                          ToastUi.showError(message: "Bu funksiya hali ishlab chiqish jarayonida");
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.dark_mode,
                        title: "Qorong'u rejim",
                        onTap: () {
                          ToastUi.showError(message: "Bu funksiya hali ishlab chiqish jarayonida");
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.notifications,
                        title: "Bildirishnomalar",
                        onTap: () {
                          ToastUi.showError(message: "Bu funksiya hali ishlab chiqish jarayonida");
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.person_2,
                        title: "Admin paneli",
                        textColor: Colors.purple,
                        iconColor: Colors.purple,
                        showBorder: false,
                        onTap: () {
                          ToastUi.showError(message: "Bu funksiya hali ishlab chiqish jarayonida");
                        },
                      ),

                      SizedBox(height: 50),

                      // Logout Button
                      GestureDetector(
                        onTap: () {
                          _showLogoutDialog(context);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.purple),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout, color: Colors.white),
                                SizedBox(width: 8),
                                Text(
                                  "Hisobdan chiqish",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                );
              } else if (state.status == ProfileStatus.failure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 64, color: Colors.red),
                      SizedBox(height: 16),
                      Text("Profilni yuklab bo'lmadi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ProfileBloc>().add(GetProfile());
                        },
                        child: Text("Qayta urinish"),
                      ),
                    ],
                  ),
                );
              }

              // This should handle the case where user is null but we're still loading/transitioning
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
    bool showBorder = true,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 8),
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: showBorder ? Border(bottom: BorderSide(width: 1, color: Colors.grey)) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor ?? Colors.black),
                SizedBox(width: 8),
                Text(title, style: TextStyle(color: textColor ?? Colors.black)),
              ],
            ),
            Icon(Icons.chevron_right, color: iconColor ?? Colors.black),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text("Hisobdan chiqish"),
          content: Text("Hisobdan chiqishni xohlaysizmi?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
              child: Text("Bekor qilish"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.read<ProfileBloc>().add(LogoutRequested());
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Chiqish"),
            ),
          ],
        );
      },
    );
  }
}
