import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/bloc/authbloc/auth_event.dart';
import 'package:crm/bloc/authbloc/auth_state.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();

  void _handleSignUp() {
    final name = _nameController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;
    final passwordConfirmation = _passwordConfirmationController.text;

    context.read<AuthBloc>().add(SignUpEvent(
          name: name,
          phone: phone,
          password: password,
          passwordConfirmation: passwordConfirmation,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // The rest of your UI code here
            GestureDetector(
              onTap: _handleSignUp,
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                    );
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                  return const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Gap(5),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
    super.dispose();
  }
}
