import 'package:crm/bloc/authbloc/auth_bloc.dart';
import 'package:crm/controllers/auth_controller.dart';
import 'package:crm/ui/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(authController: AuthController()),
          ),
        ],
        child: Container(),
      ),
    );
  }
}
