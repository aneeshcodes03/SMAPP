import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smapp/components/my_button.dart';
import 'package:smapp/components/my_textfield.dart';
import 'package:smapp/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmpwController = TextEditingController();

  //Register function
  void register() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    //make sure the password match
    if (passwordController.text != confirmpwController.text) {
      // loading
      Navigator.pop(context);

      // error message
      displayMessageToUser('Password dont match', context);
      // if password match
    } else {
      //try creating the user
      try {
        //create the user
        UserCredential? userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        // pop the loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        //loading circle
        Navigator.pop(context);
        // display error message
        displayMessageToUser(e.code, context);
      }
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
                    onTap: widget.onTap,
                    child: const Text("Already have an account ?"),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: widget.onTap,
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
