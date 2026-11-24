import 'package:flutter/material.dart';

import 'home.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  static const _signedOutMessage = 'Signed out of UniLibrary';

  final _formKey = GlobalKey<FormState>();
  final _studentIdController = TextEditingController();
  final _pinController = TextEditingController();
  bool _obscurePin = true;

  @override
  void dispose() {
    _studentIdController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    final studentId = _studentIdController.text.trim();
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute<String>(
        builder: (context) => HomeScreen(studentId: studentId),
      ),
    );

    if (result == _signedOutMessage) {
      print(_signedOutMessage);
    }
  }

  void _showInfo(String title, String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Sign In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.teal.shade50,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/library_logo.png',
                            width: 110,
                            height: 110,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.menu_book,
                              size: 58,
                              color: Colors.teal.shade700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to UniLibrary',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal.shade800,
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      controller: _studentIdController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'e.g. BSIT-F23-M-01',
                        hintText: 'e.g. BSIT-F23-M-01',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.teal.shade700,
                        ),
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if ((value ?? '').trim().isEmpty) {
                          return 'Student ID is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pinController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      obscureText: _obscurePin,
                      onFieldSubmitted: (_) => _signIn(),
                      decoration: InputDecoration(
                        labelText: 'Enter 4-digit PIN',
                        hintText: 'Enter 4-digit PIN',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.teal.shade700,
                        ),
                        suffixIcon: IconButton(
                          tooltip: _obscurePin ? 'Show PIN' : 'Hide PIN',
                          onPressed: () => setState(() {
                            _obscurePin = !_obscurePin;
                          }),
                          icon: Icon(
                            _obscurePin
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.teal.shade700,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.teal.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if ((value ?? '').trim().length < 4) {
                          return 'PIN must be at least 4 digits';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _signIn,
                            style: _buttonStyle,
                            child: const Text('Sign In'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _showInfo(
                              'Register',
                              'Please contact your university library to register.',
                            ),
                            style: _buttonStyle,
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () => _showInfo(
                          'Forgot PIN?',
                          'Please contact your university library to reset your PIN.',
                        ),
                        child: const Text('Forgot PIN?'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ButtonStyle get _buttonStyle => ElevatedButton.styleFrom(
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      );
}
