import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Pages/homePage.dart';
import 'package:preservingculturalheritage/Pages/login.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder(
      stream: _authService.stateTracker,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          Users activeUserId = snapshot.data;
          _authService.activeUserId = activeUserId.id;
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
