// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text('We\'ve sent you an email verification link. Please open it to verify your account.'),
          const Text('If you haven\'t recieved a verification email yet, click the button below.'),
          TextButton(
            onPressed: () async {
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
          }, 
            child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute, 
                (route) => false
              );
             },
            child: const Text('Restart'),
          ),
        ],
      ),
    ); 
  }
}
