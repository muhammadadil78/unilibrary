import 'package:flutter/material.dart';

import 'signin.dart';

void main() {
  runApp(const UniLibraryApp());
}

class UniLibraryApp extends StatelessWidget {
  const UniLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniLibrary - BSIT-F23-M-01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: false,
      ),
      home: const SignInScreen(),
    );
  }
}
