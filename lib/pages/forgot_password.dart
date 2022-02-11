import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ForgotPasssword extends StatefulWidget {
  @override
  _ForgotPassswordState createState() => _ForgotPassswordState();
}

class _ForgotPassswordState extends State<ForgotPasssword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Silahkan buka email anda untuk konfirmasi'),
        ),
      );
      CircularProgressIndicator();
      Navigator.pop(context);
    } catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Email masih kurang lengkap"),
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
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Center(
                    child: Text(
                      "Masukan Email Anda\nUntuk Mereset Password",
                      textAlign: TextAlign.center,
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 25,
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
                                    key: ValueKey('email'),
                                    validator: (email) => email != null &&
                                            EmailValidator.validate(email)
                                        ? 'Masukan Email Yang Benar'
                                        : null,
                                    decoration: InputDecoration.collapsed(
                                      hintText: 'Masukan Email Anda',
                                      hintStyle: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        color: Color(0xffA39C9C),
                                      ),
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      if (emailController == null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Kurang Lengkap"),
                                content: Text(
                                    "Semua Data Harus Diisi, Termasuk Foto"),
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
                      } else {
                        resetPassword();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffB12341),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Reset Password",
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
