

import 'package:ecommerce/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
    required this.nonSignedInBuilder,
    required this.signedInBuilder,
    required this.adminSignedInBuilder
  }) : super(key: key);

  final WidgetBuilder nonSignedInBuilder;
  final WidgetBuilder signedInBuilder;
  final WidgetBuilder adminSignedInBuilder;

  final adminEmail = "muzammil.ali@apprays.io";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authChanges = ref.watch(authStateChangesProvider);
    
    return authChanges.when(
      data: (user){
        return user != null 
          ? user.email == adminEmail 
            ? adminSignedInBuilder(context)
            : signedInBuilder(context)
          : nonSignedInBuilder(context);
      }, 
      loading: (){
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      error: (_,__) => Scaffold(
        body: Center(
          child: Text("Something went wrong!"),
        ),
      ),

    );
  }
}