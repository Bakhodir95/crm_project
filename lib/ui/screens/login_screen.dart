import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/bloc/authbloc/auth_event.dart';
import 'package:crm/bloc/authbloc/auth_state.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 55, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                final phone = _phoneController.text;
                final password = _passwordController.text;

                context.read<AuthBloc>().add(LoginEvent(
                      phone: phone,
                      password: password,
                    ));
              },
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
                        "Sign In",
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
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
