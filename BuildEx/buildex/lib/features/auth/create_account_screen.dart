import 'package:flutter/material.dart';
import '../../core/widgets/app_bar.dart';

// Owner: Divya. Figma: Create Account.
class CreateAccountScreen extends StatelessWidget {
  static const route = '/create-account';
  const CreateAccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: fields Full Name, Email, Password, Confirm + SIGN UP.
    return const Scaffold(
      appBar: BuildExAppBar(title: 'Create Account'),
      body: Center(child: Text('Create Account — TODO')),
    );
  }
}
