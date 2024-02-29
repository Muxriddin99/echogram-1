import 'package:echogram/pages/forgotpassword.dart';
import 'package:echogram/pages/signin.dart';
import 'package:echogram/pages/signup.dart';
import 'package:echogram/pages/home.dart';
import 'package:echogram/pages/chatpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

//testrfgrfrf
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Exception has occurred.
//PlatformException (PlatformException(null-error, Host platform returned null value for non-null return value., null, null))

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echogram',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ForgotPassword(),
    );
  }
}
