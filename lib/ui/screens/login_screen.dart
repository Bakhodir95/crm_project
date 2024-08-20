import 'package:crm/controllers/auth_controller.dart';
import 'package:crm/ui/screens/home_screen.dart';
import 'package:crm/ui/screens/phone_validation_screen.dart';
import 'package:crm/ui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:icons_flutter/icons_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = AuthController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    final name = _nameController.text;
    final password = _passwordController.text;

    final response = await auth.login(
      name,
      password,
    );

    if (response?.statusCode == 200) {
      print('Sign Up Successful!');
    } else {
      print('Sign Up Failed: ${response?.data}');
    }
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/appicon.svg'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Woorkroom",
                  style: TextStyle(
                    color: Color(0xff3A89FF),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Gap(25),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign In to Woorkroom',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Phone number",
                        style: TextStyle(
                          color: Color(0xff7D8592),
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xffB8C8E0),
                              ),
                            ),
                            hintText: "phone number",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            )),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "  Password",
                        style: TextStyle(
                          color: Color(0xff7D8592),
                          fontSize: 15,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(
                                color: Color(0xffB8C8E0),
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                            hintText: "password",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            )),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      TextButton(
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneValidationScreen(),
                        ),
                      );
                    },
                    child: InkWell(
                      onTap: _login,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff3F8CFF),
                        ),
                        child: const Row(
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
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FlutterIcons.google_ant,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(FlutterIcons.github_fea),
                      )
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Don’t have an account?",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff3F8CFF),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
