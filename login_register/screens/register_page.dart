// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muria/auth/main_page.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muria/components/input_texts.dart';

class RegisterPage extends StatefulWidget {
  static const String id = 'register_page';

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _dobController.dispose();
  }

  //sign in method
  Future signUp() async {
    if (passwordConfirmed()) {
      if (_firstNameController.text.isEmpty ||
          _lastNameController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _dobController.text.isEmpty ||
          _passwordController.text.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
                content: Text('Please fill all the fields'));
          },
        );
      } else {
        //loading indicator
        showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          },
        );

        //create user
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        //user detail
        addUserDetail(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _emailController.text.trim(),
          DateTime.parse(_dobController.text.trim()),
        );

        //redirect to main page
        Navigator.pushNamed(context, MainPage.id);
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Passwords are not match.'),
          );
        },
      );
    }
  }

  //add user detail to firestore method
  Future addUserDetail(
    String firstName,
    String lastName,
    String email,
    DateTime dob,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'dob': dob,
    });
  }

  //bool password confirmation
  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[500],
          elevation: 5,
          title: Text('Create Account'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //first name
                InputForm(controller: _firstNameController, text: 'First name'),
                SizedBox(height: 15),
                //last name
                InputForm(controller: _lastNameController, text: 'Last name'),
                SizedBox(height: 15),
                //email
                InputForm(controller: _emailController, text: 'Email'),
                SizedBox(height: 15),
                //date of birth
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Date of birth',
                      hintStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        print(pickedDate);
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          _dobController.text = formattedDate;
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
                SizedBox(height: 15),
                //password
                InputForm(controller: _passwordController, text: 'Password'),
                SizedBox(height: 15),
                //confirm password
                InputForm(
                    controller: _confirmPasswordController,
                    text: 'Confirm password'),
                SizedBox(height: 15),
                //sign up button
                Padding(
                  padding: const EdgeInsets.all(15),
                  // padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton.icon(
                    label: const Text('Sign Up'),
                    icon: const Icon(Icons.check),
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        padding: const EdgeInsets.all(15),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ))),
                    onPressed: signUp,
                  ),
                ),
                //to login page button
                OutlinedButton.icon(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.pink,
                  ),
                  label: const Text('Login page'),
                  style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ))),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
