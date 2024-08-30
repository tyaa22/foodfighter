import 'package:flutter/material.dart';
import 'package:foodfighter/services/authentication/auth_service.dart';

import '../components/border_textfield.dart';
import '../components/my_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
  TextEditingController();

  void register() async {
    final _authService = AuthService();
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await _authService.register(
            emailController.text, passwordController.text);
      }
      catch (e) {
        showDialog(
            context: context,
            builder: (context) =>
                AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    }
    else {
      showDialog(
          context: context,
          builder: (context) =>
              const AlertDialog(
                title: Text("Passwords do not match"),
              ));
    }
  }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),

            //app slogan
            Text(
              "Welcome! Let's create an account",
              style: TextStyle(
                fontSize: 16,
                color: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //email text field
            BorderTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false),
            const SizedBox(
              height: 10,
            ),

            //password text field
            BorderTextField(
                controller: passwordController,
                hintText: "Enter your password",
                obscureText: true),
            const SizedBox(
              height: 10,
            ),

            BorderTextField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true),
            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyButton(onTap: register, text: "Sign Up"),
            const SizedBox(
              height: 10,
            ),

            //redirect to login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login Here",
                    style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }
  }
