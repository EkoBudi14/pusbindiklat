import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/model/user.dart';
import 'package:pusbindiklat/pages/home/main_page.dart';
import 'package:pusbindiklat/services/auth_services.dart';
import 'package:pusbindiklat/services/post_data.dart';
import 'package:pusbindiklat/theme.dart';

bool isSignIn = false;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameUserController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();

  final CollectionReference _userRef =
      FirebaseFirestore.instance.collection('users');

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future inputData() {
    final User user = auth.currentUser;
    final uid = user.uid;
    return _userRef.doc(uid).set({
      "name": nameUserController.text,
      "email": emailController.text,
      "fullName": fullnameController.text,
      "noTelp": noTelpController.text,
    });
    // here you write the codes to input the data into firestore
  }

  User _user = FirebaseAuth.instance.currentUser;
  // Future _addToCart() async {}

  @override
  // ignore: override_on_non_overriding_member
  Widget fullNameInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Lengkap",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: fullnameController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Nama Lengkap Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userNameInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama Pengguna",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_username.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: nameUserController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Nama Pengguna',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Email Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.lock,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Password Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userNoTelpInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "No.Telp",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: Color(0xffE1E1E1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: Color(0xffB12341),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: noTelpController,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Nama Pengguna',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  header() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Silahkan Isi Data Anda",
        style: primaryTextStyle.copyWith(
          color: Colors.black,
          fontWeight: bold,
        ),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    );
  }

  Widget btnSignUp() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: TextButton(
        onPressed: () async {
          await AuthServices.signUp(
            emailController.text,
            passwordController.text,
            nameUserController.text,
            fullnameController.text,
            noTelpController.text,
          );

          // PostData.createUser(
          //   fullnameController.text,
          //   noTelpController.text,
          //   emailController.text,
          // );
          await inputData();
          print(emailController.text);
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
            backgroundColor: Color(0xffB12341),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Text(
          "Daftar",
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: Column(
        children: [
          fullNameInput(),
          userNameInput(),
          emailInput(),
          passwordInput(),
          userNoTelpInput(),
          btnSignUp(),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
