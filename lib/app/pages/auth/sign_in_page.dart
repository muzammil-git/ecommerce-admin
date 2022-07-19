import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';



class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(
          clientId: '204779599910-1p8cf63m8mkerb985tlmdfphbhtjen6k.apps.googleusercontent.com',
        ),
      
      ],

      headerBuilder: (context, constraints, _) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network('https://firebase.flutter.dev/img/flutterfire_300x.png'),
          ),
        );
      },


       
      footerBuilder: (context, _) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'By signing in, you agree to our terms and conditions.',
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}