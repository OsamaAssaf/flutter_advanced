import 'package:flutter_advanced/exports.dart';

class ProfileUiView extends StatelessWidget {
  const ProfileUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileScreen(
      providers: [
        EmailAuthProvider(),
        PhoneAuthProvider(),
        GoogleProvider(
          clientId:
              '729770279490-qaiv5mbpljsunec4o72c2ktdafc1mir7.apps.googleusercontent.com',
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
