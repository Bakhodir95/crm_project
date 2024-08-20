import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/bloc/authbloc/auth_state.dart';
import 'package:crm/services/auth_service.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:crm/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(authController: AuthController()),
            ),
          ],
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticated) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (ctx) => const HomeScreen()),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (ctx) => const RegisterScreen()),
                );
              }
            },
            child: MaterialApp(
              home: Scaffold(
                body: Container(), // Placeholder widget
              ),
            ),
          ),
        );
      },
    );
  }
}
