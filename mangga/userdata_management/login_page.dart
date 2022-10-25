import 'package:flutter/material.dart';

import '../components/input_text.dart';
import 'register_page.dart';
import 'package:mangga/components/outlined_icon_button.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        elevation: 5,
        title: Text('Login'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //email
              InputForm(
                controller: _emailController,
                text: 'Email',
                hideText: false,
              ),
              SizedBox(height: 15),
              //password
              InputForm(
                controller: _passwordController,
                text: 'Password',
                hideText: true,
              ),
              //forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Text('Forgot Password'),
                    ),
                  ),
                ],
              ),
              //login button
              Padding(
                padding: const EdgeInsets.all(15),
                // padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton.icon(
                  label: const Text('Login'),
                  icon: const Icon(Icons.login),
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      padding: const EdgeInsets.all(15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ))),
                  onPressed: () {},
                ),
              ),
              //register button
              OutlinedIconButton(
                label: 'Register',
                ikon: Icons.app_registration,
                onPress: () => Navigator.pushNamed(context, RegisterPage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
