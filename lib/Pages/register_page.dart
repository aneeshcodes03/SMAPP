import 'package:flutter/material.dart';
import 'package:smapp/components/my_button.dart';
import 'package:smapp/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //text controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpwController = TextEditingController();

  //Register function

  void register() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Smapp'), backgroundColor: Colors.blue),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 50),

              // appname
              Text("SMAPP", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 25),
              //usesrname textfield
              MyTextfield(
                hinttext: "Username",
                obscureText: false,
                controller: usernameController,
              ),
              const SizedBox(height: 10),
              //email textfield
              MyTextfield(
                hinttext: "Email",
                obscureText: false,
                controller: emailController,
              ),
              const SizedBox(height: 10),
              //password textfield
              MyTextfield(
                hinttext: "Password",
                obscureText: true,
                controller: passwordController,
              ),
              const SizedBox(height: 10),

              //pw confirm textfield
              MyTextfield(
                hinttext: "Cronfirm password",
                obscureText: true,
                controller: confirmpwController,
              ),
              const SizedBox(height: 10),

              //signin button
              MyButton(text: "Register", onTap: register),
              const SizedBox(height: 10),

              //Already have an account ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: const Text("Already have an account ?"),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      "Login here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
