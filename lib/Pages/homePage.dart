import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _signOut)
        ],
      ),
      body: Text("data"),
    );
  }

  void _signOut() {
    Provider.of<AuthService>(context, listen: false).logOut();
  }
}
