import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:pusbindiklat/services/auth_services.dart';
import 'package:pusbindiklat/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
