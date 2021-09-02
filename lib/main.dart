import 'package:flutter/material.dart';
import 'package:pusbindiklat/pages/Prestasi_page.dart';
import 'package:pusbindiklat/pages/edit_profile_page.dart';
import 'package:pusbindiklat/pages/home/home_page.dart';
import 'package:pusbindiklat/pages/home/main_page.dart';
import 'package:pusbindiklat/pages/profile_kami_page.dart';
import 'package:pusbindiklat/pages/sign_in_page.dart';
import 'package:pusbindiklat/pages/sign_up_page.dart';
import 'package:pusbindiklat/pages/splash_page.dart';
import 'package:pusbindiklat/pages/tata_tertib_page.dart';
import 'package:pusbindiklat/pages/tentang_kami.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/edit-profile': (context) => EditProfile(),
        '/tata-tertib': (context) => TatatertibPage(),
        '/prestasi': (context) => PrestasiPage(),
        '/profile-kami': (context) => ProfileKami(),
        '/tentang-kami': (context) => TentangKami(),
      },
    );
  }
}
