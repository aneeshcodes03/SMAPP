import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_button.dart';
import 'package:smapp/components/my_textfield.dart';
import 'package:smapp/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key, required this.onTap});
  final void Function()? onTap;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //Login function
  void login() async {
    // loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    // try signin
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading circle
      if (context.mounted) Navigator.pop(context);
    }
    // display any error
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

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

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("Forgot Password?")],
              ),
              const SizedBox(height: 10),
              //signin button
              MyButton(text: "Login", onTap: login),
              const SizedBox(height: 10),

              //dont have an accoutn ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an account ?"),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register",
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
