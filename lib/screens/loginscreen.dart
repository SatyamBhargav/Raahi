import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raahi/screens/createaccountscreen.dart';
import 'package:raahi/screens/tabscreen.dart';
import 'package:raahi/widget/frostedglass.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void loginuser() async {
    setState(() {
      _isLoading = true;
    });
    String emailOrUsername = _usernameController.text.trim();
    String password = _passwordController.text;

    try {
      // Check if the input is an email
      if (emailOrUsername.contains('@')) {
        // Sign in with email
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailOrUsername,
          password: password,
        );
      } else {
        // Sign in with username
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('username', isEqualTo: emailOrUsername)
            .limit(1)
            //The limit(1) ensures that only one document (if any) is retrieved.
            //The result is stored in a QuerySnapshot named querySnapshot.
            .get();
        if (querySnapshot.docs.isNotEmpty) {
          String email = querySnapshot.docs.first['email'];
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
        } else {
          print('User not found with the provided username');

          return; // Add appropriate handling for user not found
        }
      }

      // If the authentication is successful, navigate to the TabScreen
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const TabScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email/username.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('Error: $e');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: FrostGlass(
            height: 500.0,
            width: 380.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 30),
                ),
                const Text(
                  'Please sign in to your account',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        children: [
                          TextFormField(
                              controller: _usernameController,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 30, top: 40),
                                  hintText: 'Email or username',
                                  hintStyle: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  filled: true,
                                  fillColor: const Color(0xff00303D),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          const SizedBox(height: 10),
                          TextFormField(
                              controller: _passwordController,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 30, top: 40),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  filled: true,
                                  fillColor: const Color(0xff00303D),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(25)))),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          _isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : ElevatedButton(
                                  style: const ButtonStyle(
                                      minimumSize: MaterialStatePropertyAll(
                                          Size.fromHeight(50)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xff5566ff))),
                                  onPressed: () {
                                    loginuser();
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(color: Colors.white),
                                  )),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have An Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateAccount()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
