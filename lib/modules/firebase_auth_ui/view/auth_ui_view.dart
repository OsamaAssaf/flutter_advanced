import 'package:flutter_advanced/exports.dart';

class AuthUiView extends StatelessWidget {
  const AuthUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [
        EmailAuthProvider(),
        PhoneAuthProvider(),
        GoogleProvider(
          clientId:
              '729770279490-qaiv5mbpljsunec4o72c2ktdafc1mir7.apps.googleusercontent.com',
        ),
      ],
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return const ProfileUiView();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
