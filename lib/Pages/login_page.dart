import 'package:flutter/material.dart';
import 'package:smapp/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Smapp'), backgroundColor: Colors.blue),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),

            // appname
            Text("SMAPP", style: TextStyle(fontSize: 20)),

            //email textfield
            MyTextfield(
              hinttext: "",
              obscureText: false,
              controller: emailController,
            ),

            //password textfield

            //forgot password

            //signin button

            //dont have an accoutn ?
          ],
        ),
      ),
    );
  }
}
