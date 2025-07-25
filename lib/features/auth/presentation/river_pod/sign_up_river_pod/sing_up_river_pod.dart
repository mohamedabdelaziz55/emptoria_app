import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../../core/routes/app_route.gr.dart';
import '../../../../../main.dart';

final obscurePasswordProvider = StateProvider<bool>((ref) => true);
final obscureConfirmPasswordProvider = StateProvider<bool>((ref) => true);
final isSignUpLoadingProvider = StateProvider<bool>((ref) => false);

final signUpProvider = Provider((ref) => SignUpController(ref));

class SignUpController {
  final Ref ref;

  SignUpController(this.ref);

  bool isPasswordStrong(String password) {
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasSpecialChars = password.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    final hasMinLength = password.length >= 8;

    return hasUpperCase &&
        hasLowerCase &&
        hasDigits &&
        hasSpecialChars &&
        hasMinLength;
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    if (!isPasswordStrong(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password must be at least 8 characters, include upper/lowercase letters, a number, and a symbol',
          ),
        ),
      );
      return;
    }

    ref.read(isSignUpLoadingProvider.notifier).state = true;
    final supabase = Supabase.instance.client;

    try {
      final response = await supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        data: {'display_name': name.trim()},
      );

      final user = response.user;
      if (user != null && response.session != null) {
        await sp.setString('user_id', user.id);
        await sp.setString('user_email', user.email ?? '');
        await sp.setString('display_name', name);

        context.pushRoute(DashboardRoute());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Check your email to verify your account'),
          ),
        );
      }
      if (user != null) {
        context.pushRoute(DashboardRoute());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Check your email to verify your account'),
          ),
        );
      }
    } catch (e) {
      final errorMessage = e.toString().contains('confirmation')
          ? 'Check your email to confirm your account'
          : 'Signup failed: $e';
      print("err $e      ********************/*************************/");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    } finally {
      ref.read(isSignUpLoadingProvider.notifier).state = false;
    }
  }
}
