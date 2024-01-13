import 'package:box/new/succ.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controllers for text fields
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  // Form key for validation
  final _signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Dispose controllers to free up resources
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Initialize controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    super.initState();
  }

  // Validation functions
  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$').hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(password);
  }

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!isEmailValid(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!isPasswordValid(value)) {
      return 'Invalid password';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _submitForm() {
    if (_signupFormKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Succ(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 218, 11),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _signupFormKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  // Rectangle for uploading photo
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                    // You can replace this with your photo upload logic
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Text field for Name
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                      ),
                      validator: _nameValidator,
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text field for Email
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                      ),
                      validator: _emailValidator,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text field for Password
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                      ),
                      validator: _passwordValidator,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text field for Confirm Password
                  Container(
                    height: 70,
                    width: 300,
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        filled: true,
                        fillColor: const Color(0xFFD9D9D9),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFD9D9D9),
                            width: 5.0,
                          ),
                          borderRadius: BorderRadius.circular(13.00),
                        ),
                      ),
                      validator: _confirmPasswordValidator,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Elevated button for registration
                  SizedBox(
                    height: 70,
                    width: 300,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 218, 11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
