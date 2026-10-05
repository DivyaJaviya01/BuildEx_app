import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Krisha. Figma: Sign In.
class SignInScreen extends StatelessWidget {
  static const route = '/sign-in';
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: Username/Email + Password + SIGN IN + Forgot Password.
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Sign In'),
      body: Center(child: Text('Sign In — TODO')),
    );
  }
}
