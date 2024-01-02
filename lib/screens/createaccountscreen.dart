import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:raahi/screens/loginscreen.dart';
import 'package:raahi/widget/frostedglass.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void createUserWithEmailAndPassword() async {
    print(_emailController.text);
    print(_passwordController.text);
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
              children: [
                Text(
                  'Create New Account',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 30),
                ),
                const Text(
                  'Please fill in the form to continue',
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 30, top: 40),
                              hintText: 'Full Name',
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white30),
                              filled: true,
                              fillColor: const Color(0xff00303D),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)))),
                      const SizedBox(height: 10),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          cursorColor: Colors.white,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.only(left: 30, top: 40),
                              hintText: 'Email Address',
                              hintStyle: const TextStyle(
                                  fontSize: 15, color: Colors.white30),
                              filled: true,
                              fillColor: const Color(0xff00303D),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(25)))),
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
                                  borderRadius: BorderRadius.circular(25)))),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          style: const ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size.fromHeight(50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(Color(0xff5566ff))),
                          onPressed: () {
                            createUserWithEmailAndPassword();
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already Have An Account?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(color: Colors.blueAccent),
                              ))
                        ],
                      ),
                    ],
                  )),
                ),
                // const Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Divider(
                //       color: Colors.green,
                //       endIndent: 200,
                //       thickness: 50,
                //     ),
                //     Text('Or'),
                //     Divider(
                //       endIndent: 200,
                //       thickness: 50,
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
