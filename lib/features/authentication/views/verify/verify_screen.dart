import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:urgut_please/config/routes/routes.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/snackbar.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/login/login_state.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_bloc.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_event.dart';
import 'package:urgut_please/features/authentication/viewmodels/verify/verify_state.dart';
import 'package:urgut_please/shared/widgets/submit_button.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key, required this.login, this.password, required this.resetPassword});

  final String login;
  final String? password;
  final bool resetPassword;

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _verificationCodeController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Automatically send verification code when screen opens
    context.read<VerifyBloc>().add(SendVerificationRequested(widget.login));
  }

  @override
  void dispose() {
    _verificationCodeController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  String _formatTimer(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hisobni tasdiqlash"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: BlocListener<VerifyBloc, VerifyState>(
        listener: (context, state) {
          if (state.status == VerifyStatus.success) {
            ToastUi.showToast(message: "Hisobingiz muvaffaqiyatli tasdiqlandi!");
            context.read<LoginBloc>().add(LoginRequested(widget.login, widget.password ?? ''));
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state.status == LoginStatus.success) {
                  context.pushReplacement(Routes.home);
                }
              },
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        50.h,

                        // Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(Icons.lock_outline, size: 40, color: Colors.blue),
                        ),

                        24.h,

                        // Title
                        const Text(
                          "Tasdiqlash kodi",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),

                        12.h,

                        // Description
                        Text(
                          "${widget.login} raqamiga yuborilgan tasdiqlash kodini kiriting",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                        40.h,

                        // Verification Code Input
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            controller: _verificationCodeController,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 8),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            decoration: InputDecoration(
                              hintText: "• • • • •",
                              hintStyle: TextStyle(fontSize: 24, color: Colors.grey[400], letterSpacing: 8),
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
                              if (value == null || value.isEmpty) {
                                return 'Tasdiqlash kodini kiriting';
                              }
                              if (value.length < 6) {
                                return 'Kod 4 xonali bo\'lishi kerak';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              if (value.length == 6) {
                                _focusNode.unfocus();
                              }
                            },
                          ),
                        ),

                        24.h,

                        // Resend Section
                        BlocBuilder<VerifyBloc, VerifyState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                if (state.resendTimer > 0)
                                  Text(
                                    "Kod qayta yuborish: ${_formatTimer(state.resendTimer)}",
                                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                  )
                                else
                                  TextButton(
                                    onPressed: state.canResend
                                        ? () {
                                            context.read<VerifyBloc>().add(SendVerificationRequested(widget.login));
                                          }
                                        : null,
                                    child: const Text(
                                      "Kodni qayta yuborish",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                if (state.status == VerifyStatus.failure && state.errorMessage != null)
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Submit Button
                BlocBuilder<VerifyBloc, VerifyState>(
                  builder: (context, state) {
                    final isLoading = state.status == VerifyStatus.loading;

                    return SubmitButton(
                      loading: isLoading,
                      onPressed: isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                context.read<VerifyBloc>().add(
                                  VerifyRequested(widget.login, _verificationCodeController.text.trim()),
                                );
                              }
                            },
                    );
                  },
                ),

                16.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
