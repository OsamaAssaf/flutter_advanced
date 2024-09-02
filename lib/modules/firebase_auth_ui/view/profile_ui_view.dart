import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

class ProfileUiView extends StatelessWidget {
  const ProfileUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: [
        EmailAuthProvider(),
        PhoneAuthProvider(),
        GoogleProvider(
          clientId: '729770279490-qaiv5mbpljsunec4o72c2ktdafc1mir7.apps.googleusercontent.com',
        ),
      ],
      actions: [
        SignedOutAction(
          Navigator.pop,
        ),
      ],
    );
  }
}
