import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/pages/forgot_password.dart';
import 'package:pusbindiklat/pages/home/main_page.dart';
import 'package:pusbindiklat/pages/sign_up_page.dart';
import 'package:pusbindiklat/services/auth_services.dart';
import 'package:pusbindiklat/theme.dart';

bool isSignIn = false;

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  AuthServices _authServices = AuthServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(
          left: 30,
          right: 30,
          bottom: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang\nSilahkan Login",
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 14,
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

    Widget forgotPassword() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Row(
          children: [
            Text(
              "Apakah Anda Lupa Password ?",
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPasssword()));
              },
              child: Text(
                "Klik Disini",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: bold,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signUp() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 16,
        ),
        // ignore: deprecated_member_use
        child: OutlineButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          borderSide: BorderSide(color: primaryColor, width: 2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            "Daftar",
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    Widget btnSignIn() {
      return isSignIn
          ? Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
              ),
              child: TextButton(
                onPressed: () async {
                  setState(() {
                    isSignIn = true;
                  });
                  User _auth = await AuthServices.signIn(
                      emailController.text, passwordController.text);

                  if (_auth == null) {
                    // setState(() {
                    //   isSignIn = false;
                    // });
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Anda Gagal Login"),
                            content: Text(
                                "Email Dan Password Yang Anda Masukan Salah"),
                            actions: [
                              // ignore: deprecated_member_use
                              RaisedButton(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Text("Coba Lagi"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),

                              // ignore: deprecated_member_use
                              // FlatButton(onPressed: () {
                              //   Navigator.pop(context);
                              // }, child: Text("Coba Lagi"))
                            ],
                          );
                        });
                  }
                  setState(() {
                    isSignIn = false;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color(0xffB12341),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Text(
                  "Masuk",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 50,
                    bottom: 30,
                  ),
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/logo_ts.jpeg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            title(),
            emailInput(),
            passwordInput(),
            forgotPassword(),
            btnSignIn(),
            signUp(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
