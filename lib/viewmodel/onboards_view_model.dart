import 'package:finalhackathon/view/map_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OnboardsViewModel extends BaseViewModel {
  bool _isCreateAccount = true;
  bool _isObscured = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  bool get isCreateAccount => _isCreateAccount;
  bool get isObscured => _isObscured;

  void toggleAuthMode() {
    _isCreateAccount = !_isCreateAccount;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MapsView()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Login failed. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password.';
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> register(BuildContext context) async {
    try {
      debugPrint("Attempting to register user...");
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      debugPrint("User registered: ${userCredential.user!.uid}");

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration successful!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const MapsView()),
      );
    } on FirebaseAuthException catch (e) {
      debugPrint("FirebaseAuthException: ${e.code} - ${e.message}");
      String errorMessage = 'Registration failed. Please try again.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'An account already exists for this email.';
      }
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      debugPrint("Unexpected error: $e");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return ViewModelBuilder<OnboardsViewModel>.reactive(
          viewModelBuilder: () => this,
          builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 20,
                left: 20,
                right: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    Center(
                      child: Container(
                        height: 5,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: viewModel.toggleAuthMode,
                            child: Column(
                              children: [
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: viewModel.isCreateAccount
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                                if (viewModel.isCreateAccount)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 3,
                                    width: 120,
                                    color: Colors.red,
                                  ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: viewModel.toggleAuthMode,
                            child: Column(
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: !viewModel.isCreateAccount
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                                if (!viewModel.isCreateAccount)
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    height: 3,
                                    width: 60,
                                    color: Colors.red,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (viewModel.isCreateAccount) ...[
                      _buildLabeledTextField("Full Name"),
                      const SizedBox(height: 10),
                      _buildLabeledTextField("Email"),
                      const SizedBox(height: 10),
                      _buildLabeledTextField("Password", obscureText: true),
                    ] else ...[
                      _buildLabeledTextField("Email"),
                      const SizedBox(height: 10),
                      _buildLabeledTextField("Password",
                          obscureText: true, showForgotPassword: true),
                    ],
                    const SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (viewModel.isCreateAccount) {
                              viewModel.register(context);
                            } else {
                              viewModel.login(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD61355),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            viewModel.isCreateAccount ? "Sign Up" : "Login",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLabeledTextField(String label,
      {bool obscureText = false, bool showForgotPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: label == "Full Name"
              ? nameController
              : (label == "Email" ? emailController : passwordController),
          obscureText: obscureText,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        if (showForgotPassword)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
