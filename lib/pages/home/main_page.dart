import 'package:flutter/material.dart';
import 'package:pusbindiklat/pages/home/home_page.dart';
import 'package:pusbindiklat/pages/home/profile_page.dart';
import 'package:pusbindiklat/theme.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  'assets/icon_home.png',
                  width: 33,
                  color: currentIndex == 0 ? primaryColor : Color(0xffBDBDBD),
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Image.asset(
                  'assets/icon_person.png',
                  width: 40,
                  color: currentIndex == 1 ? primaryColor : Color(0xffBDBDBD),
                ),
              ),
              label: '',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          // ignore: dead_code
          break;
        case 1:
          return ProfilePage();
          // ignore: dead_code
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      bottomNavigationBar: customButtonNav(),
      body: body(),
    );
  }
}
