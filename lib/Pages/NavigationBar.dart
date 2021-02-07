import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:preservingculturalheritage/Pages/Profile.dart';
import 'package:preservingculturalheritage/Pages/homePage.dart';
import 'package:preservingculturalheritage/Services/AuthService.dart';
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
          HomePage(),
          ProfileApp(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 48,
        animationDuration: Duration(
          milliseconds: 900,
        ),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.search,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.grey,
          ),
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: _signOut)
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
