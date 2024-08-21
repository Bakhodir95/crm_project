import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/bloc/authbloc/auth_event.dart';
import 'package:crm/bloc/authbloc/auth_state.dart';
import 'package:crm/services/auth_service.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:crm/ui/screens/login_screen.dart';
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
              create: (context) => AuthBloc(authController: AuthController())
                ..add(CheckUserTokenEvent()),
            ),
          ],
          child: MaterialApp(
            home: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthAuthenticated) {
                  print(state.token);
                  return const HomeScreen();
                } else if (state is AuthLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return const LoginScreen();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
