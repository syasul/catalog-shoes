import 'package:catalog/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:catalog/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:catalog/constants.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              if (streamSnapshot.hasError) {
                //StreamSnapshoot
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }

              if (streamSnapshot.connectionState == ConnectionState.active) {
                User _user = streamSnapshot.data;
                if (_user == null) {
                  return LoginPage();
                } else {
                  return HomePage();
                }
              }

              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Authentication",
                    style: Constants.regularHeading,
                  ),
                ),
              );
            },
          );
        }

        return Scaffold(
          body: Center(
            child: Text("initialization App..."),
          ),
        );
      },
    );
  }
}
