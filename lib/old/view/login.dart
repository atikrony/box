// import 'package:box/view/custom_appbar.dart';
import 'package:box/old/view/home.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormkey = GlobalKey<FormState>();
  //late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    // _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    //_nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // String? _nameValidator(String? value) {
  //   if (value == null) {
  //     return 'Name is required';
  //   } else if (value.isEmpty) {
  //     return 'Name cannot be empty';
  //   } else {
  //     return null;
  //   }
  // }

  String? _emailValidator(String? value) {
    if (value == null) {
      return 'Email is required';
    } else if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (isEmailValid(value) == false) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    if (value == null) {
      return 'Password is required';
    } else if (value.isEmpty) {
      return 'Password cannot be empty';
    } else if (isPasswordValid(value) == false) {
      return 'Invalid password';
    } else {
      return null;
    }
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
  }

  void _submitForm() {
    if (_loginFormkey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "BOX",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 218, 11),
      ),
      body: Center(
        child: Form(
          key: _loginFormkey,
          child: Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    flex: 1,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Flexible(
                  //   flex: 1,
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(10),
                  //     child: TextFormField(
                  //       controller: _nameController,
                  //       decoration: const InputDecoration(
                  //         border: OutlineInputBorder(),
                  //         labelText: 'Name',
                  //       ),
                  //       validator: _nameValidator,
                  //     ),
                  //   ),
                  // ),

                  //Email_Text_Field

                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                            labelText: 'Email',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                          ),
                          validator: _emailValidator,
                        ),
                      ),
                    ),
                  ),
                  //Password_Text_Field
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                            labelText: 'Password',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                            ),
                          ),
                          validator: _passwordValidator,
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Forgot Password?"),
                      ],
                    ),
                  ),
                  //Submit_button
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        child: const Text('Submit'),
                      ),
                    ),
                  ),

                  //Sign_up_button
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Sign Up"),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
