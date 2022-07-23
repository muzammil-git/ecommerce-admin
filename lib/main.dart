import 'package:ecommerce/app/auth_widget.dart';
import 'package:ecommerce/app/pages/admin_home.dart';
import 'package:ecommerce/app/pages/sign_in_page.dart';
import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          primary: Colors.orange,
          seedColor: Colors.orange,
          
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(12),
            ),

            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      ),
      home: AuthWidget(
        signedInBuilder: (context) => Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Signed In"),
                ElevatedButton(
                  onPressed: (){
                    ref.read(firebaseAuthProvider).signOut();
                  },
                  child: Text("Sign out"),
                )
              ],
            ),
          ),
        ),
        nonSignedInBuilder: (context) => const SignInPage(),
        adminSignedInBuilder:(context) => const AdminHome(),
        ),
        
      );

  }
}


// final counterProvider = StateNotifierProvider((ref) {
//   return Counter();
// });

// class Counter extends StateNotifier<int> {
//   Counter() : super(0);

//   void increment() => state++;
// }


