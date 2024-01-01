import 'dart:ui';

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
  @override
  Widget build(BuildContext context) {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

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
                                  hintText: 'Username',
                                  hintStyle: const TextStyle(
                                      fontSize: 15, color: Colors.white30),
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
                                      fontSize: 15, color: Colors.white30),
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
                          ElevatedButton(
                              style: const ButtonStyle(
                                  minimumSize: MaterialStatePropertyAll(
                                      Size.fromHeight(50)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xff5566ff))),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TabScreen()));
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                // GestureDetector(
                //   onTap: () => _handelGoogleSignIn(),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 40),
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(vertical: 5),
                //       decoration: BoxDecoration(
                //           color: Colors.white,
                //           borderRadius: BorderRadius.circular(20)),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Image.asset('images/google.png', height: 40),
                //           const SizedBox(width: 15),
                //           const Text('Sign in with Google')
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
