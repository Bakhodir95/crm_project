import 'package:crm/controllers/auth_controller.dart';
import 'package:crm/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _authController.logout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => const LoginScreen()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
