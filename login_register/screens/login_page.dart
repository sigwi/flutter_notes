import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muria/auth/main_page.dart';
import 'package:muria/screens/register_page.dart';
import 'package:muria/screens/reset_pw_page.dart';
import 'package:muria/components/input_texts.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //sign in method
  Future signIn() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Please fill all the fields.'));
          });
    } else {
      //loading indicator
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }

    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    //go to main page
    Navigator.pushNamed(context, MainPage.id);
  }

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
              SizedBox(height: 50),
              //email
              InputForm(controller: _emailController, text: 'Email'),
              SizedBox(height: 15),
              //password
              InputForm(controller: _passwordController, text: 'Password'),
              //forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, ResetPasswordPage.id),
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
                  onPressed: signIn,
                ),
              ),
              //register button
              OutlinedButton.icon(
                label: const Text('Register'),
                icon: const Icon(
                  Icons.app_registration,
                  color: Colors.pink,
                ),
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ))),
                onPressed: () => Navigator.pushNamed(context, RegisterPage.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
