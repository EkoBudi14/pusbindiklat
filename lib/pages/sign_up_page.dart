import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/model/user.dart';
import 'package:pusbindiklat/pages/home/main_page.dart';
import 'package:pusbindiklat/services/auth_services.dart';
import 'package:pusbindiklat/services/post_data.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:image_picker/image_picker.dart';

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

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();

  String _email = '';
  String _password = '';
  String _name = '';
  String _fullName = '';
  bool isSignIn = false;

  String _noTelpn = '';
  File _pickedImage;
  String url;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // GlobalMethods _globalMethods = GlobalMethods();
  bool _isLoading = false;

  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _nameFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {}

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // _images.add(File(pickedFile.path));
        _pickedImage =
            File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  // ignore: override_on_non_overriding_member
  Widget fullNameInput() {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
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
                      key: ValueKey('FullName'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Nama Lengkap Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_fullNameFocusNode),
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        _fullName = value;
                      },
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

  // Widget photo() {
  //   return GestureDetector(
  //     onTap: () async {
  //       getImage();
  //     },
  //     child: Container(
  //       height: 100,
  //       width: 100,
  //       child: Container(
  //           decoration: BoxDecoration(
  //             shape: BoxShape.circle,
  //           ),
  //           child: _pickedImage != null
  //               ? ClipRRect(
  //                   borderRadius: BorderRadius.circular(50),
  //                   child: Image.file(
  //                     _pickedImage,
  //                     height: 100,
  //                     width: 100,
  //                     fit: BoxFit.cover,
  //                   ),
  //                 )
  //               : Image.asset("assets/image_profile.png")),
  //     ),
  //   );
  // }

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
                      key: ValueKey('name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Email Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_nameFocusNode),
                      keyboardType: TextInputType.name,
                      onSaved: (value) {
                        _name = value;
                      },
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
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Email Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_emailFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _email = value;
                      },
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
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan Password Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      keyboardType: TextInputType.visiblePassword,
                      onSaved: (value) {
                        _password = value;
                      },
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
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Harus Diisi';
                        }
                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukan No Telepon Anda',
                        hintStyle: primaryTextStyle.copyWith(
                          fontSize: 14,
                          color: Color(0xffA39C9C),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_phoneNumberFocusNode),
                      keyboardType: TextInputType.phone,
                      onSaved: (value) {
                        _noTelpn = value;
                      },
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
    return _isLoading
        ? Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
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
                final isValid = _formKey.currentState.validate();
                FocusScope.of(context).unfocus();
                // var date = DateTime.now().toString();
                // var dateparse = DateTime.parse(date);
                // var formattedDate = "${dateparse.day}-${dateparse.month}-${dateparse.year}";
                if (isValid) {
                  _formKey.currentState.save();
                  try {
                    setState(() {
                      _isLoading = true;
                    });
                    // final ref = FirebaseStorage.instance
                    //     .ref()
                    //     .child('usersImages')
                    //     .child(_name + '.jpg');
                    // await ref.putFile(_pickedImage);
                    // url = await ref.getDownloadURL();
                    await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    final User user = _auth.currentUser;
                    final _uid = user.uid;
                    // user.updateProfile(photoURL: url, displayName: _name);
                    // user.reload();
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(_uid)
                        .set({
                      'id': _uid,
                      'name': _name,
                      'email': _email,
                      'phoneNumber': _noTelpn,
                      // 'imageUrl': url,
                      'fullName': _fullName,
                    });
                    Navigator.pop(context);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Text("Anda gagal daftar"),
                              content:
                                  Text("Email yang anda pakai sudah digunakan"),
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
                  } catch (error) {
                    print('error occured ${error.message}');
                  } finally {
                    setState(() {
                      _isLoading = false;
                    });
                  }
                }
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
          SizedBox(
            height: 25,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                // photo(),
                fullNameInput(),
                userNameInput(),
                emailInput(),
                passwordInput(),
                userNoTelpInput(),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          btnSignUp(),
          SizedBox(
            height: 20,
          ),
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
