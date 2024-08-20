import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/bloc/authbloc/auth_event.dart';
import 'package:crm/bloc/authbloc/auth_state.dart';
import 'package:crm/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        leading: Text("Salom Mening Ismim "),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedOut) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const LoginScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Center(
          child: Text('Welcome to the Home Screen!'),
        ),
      ),
    );
  }
}
