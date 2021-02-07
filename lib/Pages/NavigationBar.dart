import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:preservingculturalheritage/Pages/Profile.dart';
import 'package:preservingculturalheritage/Pages/homePage.dart';
import 'package:preservingculturalheritage/Pages/uploadPage.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
import 'package:preservingculturalheritage/style/theme.dart' as Theme;
import 'package:provider/provider.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int activePageNumber = 0;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String activeUserId =
        Provider.of<AuthService>(context, listen: false).activeUserId;
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (openedPageNumber) {
          setState(() {
            activePageNumber = openedPageNumber;
          });
        },
        controller: pageController,
        children: [
          HomePage(),
          UploadPage(),
          ProfileApp(
            profilOwnerId: activeUserId,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 48,
        backgroundColor: Theme.Colors.homepage,
        animationDuration: Duration(
          milliseconds: 900,
        ),
        items: [
          Icon(
            FontAwesomeIcons.home,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            FontAwesomeIcons.photoVideo,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            FontAwesomeIcons.user,
            size: 30,
            color: Colors.grey,
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.grey[600],
            ),
            onPressed: _signOut,
          )
        ],
        onTap: (selectedPageNumber) {
          setState(() {
            pageController.jumpToPage(selectedPageNumber);
          });
        },
      ),
    );
  }

  void _signOut() {
    Provider.of<AuthService>(context, listen: false).logOut();
  }
}
