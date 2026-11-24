import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.studentId});

  final String studentId;

  static const _signedOutMessage = 'Signed out of UniLibrary';

  Future<void> _confirmSignOut(BuildContext context) async {
    final shouldSignOut = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Do you want to sign out of UniLibrary?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );

    if (shouldSignOut == true && context.mounted) {
      Navigator.pop(context, _signedOutMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, $studentId'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: 'Sign Out',
            onPressed: () => _confirmSignOut(context),
            icon: const Icon(Icons.power_settings_new),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'You are signed in to UniLibrary',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.teal.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
