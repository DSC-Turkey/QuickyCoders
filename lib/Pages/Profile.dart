import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Models/Users.dart';
import 'package:preservingculturalheritage/Services/FirebaseHist-ArtServices.dart';
import 'package:preservingculturalheritage/style/theme.dart' as Theme;

class ProfileApp extends StatefulWidget {
  final String profilOwnerId;

  const ProfileApp({Key key, this.profilOwnerId}) : super(key: key);
  @override
  _ProfileAppState createState() => _ProfileAppState();
}

class _ProfileAppState extends State<ProfileApp> {
  Users _user;
  Future<Users> getUser() async {
    Users user = await FirebaseHistArtServices().getUsers(widget.profilOwnerId);
    setState(() {
      _user = user;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Theme.Colors.gradientStartColor,
                    Theme.Colors.homepage
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.3, 0.7])),
        ),
        // backgroundColor: Colors.redAccent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Theme.Colors.gradientStartColor,
                      Theme.Colors.homepage
                    ],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: [0.3, 0.7]),
              ),
              child: Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          _user.photoUrl,
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Text(
                        _user.userName,
                        style: TextStyle(
                            fontFamily: 'MontserratLight',
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Hakkında: " + _user.detail,
              style: TextStyle(
                  fontFamily: 'MontserratLight',
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
          )),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Theme.Colors.gradientStartColor,
                          Theme.Colors.homepage
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: [0.3, 0.7]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Benimle İletişime Geç",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratLight',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
