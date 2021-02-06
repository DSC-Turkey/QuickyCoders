import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Pages/authPage.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
        create: (_) => AuthService(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Culture App',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthPage(),
        ));
  }
}
