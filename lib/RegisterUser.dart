import 'package:flutter/material.dart';
import 'package:gdsc_app/LoginScreen.dart';
import 'Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'MyNavigationDrawer.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  int _charCount = 0;
  int _charCount2 = 0;
  bool _isPasswordValid = false;
  bool _isrePasswordValid = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    repasswordController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Image.asset("assets/gdsc-social-share.png"),
            ),
            Center(
              child: Column(
                children: [
                  // const Text(
                  //   'Hello',
                  //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  // ),
                  // const Text(
                  //   'Enter your Details to Register',
                  //   style: TextStyle(fontSize: 20, color: Colors.grey),
                  // ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(),
                                  labelText: 'Name',
                                  hintText: 'Enter Your Name',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  border: OutlineInputBorder(),
                                  labelText: 'Phone',
                                  hintText: 'Enter Your Phone Number',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (value.length != 10)
                                    return 'Please enter valid phone number';
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                                controller: emailController,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText: 'Enter Your Email',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (!RegExp(
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                      .hasMatch(value))
                                    return 'Please enter valid email';
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: !_passwordVisible,
                              onChanged: (value) {
                                setState(() {
                                  _charCount = value.length;
                                  if (_charCount > 20) {
                                    _isPasswordValid = false;
                                  } else {
                                    _isPasswordValid = true;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                border: const OutlineInputBorder(),
                                labelText: 'Password',
                                hintText: 'Enter Your Password',
                                counterText: '$_charCount / 20',
                                suffixIcon: IconButton(
                                  icon: Icon((_passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                } else if (_isPasswordValid == false) {
                                  return "Please Enter password within 20 characters";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: repasswordController,
                              obscureText: !_passwordVisible2,
                              onChanged: (value) {
                                setState(() {
                                  _charCount2 = value.length;
                                  if (_charCount2 > 20) {
                                    _isrePasswordValid = false;
                                  } else {
                                    _isrePasswordValid = true;
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                border: const OutlineInputBorder(),
                                labelText: 'Re-Password',
                                hintText: 'Re-Enter yourPassword',
                                // counterText: '$_charCount2 / 20',
                                suffixIcon: IconButton(
                                  icon: Icon((_passwordVisible2
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible2 = !_passwordVisible2;
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Re-Enter your Password';
                                } else if (value != passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text("Already have an accout? Log In")),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16.0),
                            child: Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.purple,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 170, right: 170),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      if (emailController.text.isNotEmpty ||
                                          passwordController.text.isNotEmpty) {
                                        await _auth
                                            .createUserWithEmailAndPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Homepage(),
                                          ),
                                        );
                                        dispose();
                                      } else if (passwordController.text !=
                                          repasswordController.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Password Does\'nt Match')),
                                        );
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('User Already Exists')),
                                      );
                                    } catch (_) {}
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Log In Failed')),
                                    );
                                  }
                                },
                                child: const Text('Submit'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
