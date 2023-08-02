import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<TextEditingController> emailControllerProvider =
    StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final StateProvider<TextEditingController> passwordControllerProvider =
    StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final StateProvider<bool> obscureTextProvider = StateProvider<bool>((ref) {
  return true;
});

final Provider<String?> emailErrorProvider = Provider<String?>((ref) {
  final email = ref.watch(emailControllerProvider).text;
  // TODO* Additional email validation logic can be added here

  if (email.isEmpty) {
    return 'Email is required';
  }

  return null;
});

final Provider<String?> passwordErrorProvider = Provider<String?>((ref) {
  final password = ref.watch(passwordControllerProvider).text;

  // TODO* Additional password validation logic can be added here

  if (password.isEmpty) {
    return 'Password is required';
  }
  return null;
});

final Provider<bool> loginFormProvider = Provider<bool>((ref) {
  final String? emailError = ref.watch(emailErrorProvider);
  final String? passwordError = ref.watch(passwordErrorProvider);

  return emailError == null && passwordError == null ? true : false;
});
