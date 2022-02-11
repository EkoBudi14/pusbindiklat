import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pusbindiklat/model/user.dart';
import 'package:pusbindiklat/pages/home/main_page.dart';
import 'package:pusbindiklat/services/get_data.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:path/path.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  Users users = Users();

  User _user = FirebaseAuth.instance.currentUser;
  bool isDataEdit = false;
  bool isUpdating = false;
  bool isDataEdited = false;
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  TextEditingController nameUserController;
  bool _displayFullname = true;
  bool _displayName = true;
  bool _displayEmail = true;
  String profilePath;
  File profileImage;
  String _name = '';
  String url;

  Future getImage() async {
    ImagePicker picker = ImagePicker();
    PickedFile pickedFile;

    pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // _images.add(File(pickedFile.path));
        profileImage =
            File(pickedFile.path); // Use if you only need a single picture
      } else {
        print('No image selected.');
      }
    });
  }

  updatedProfile() async {
    var collection = FirebaseFirestore.instance.collection('users');
    // final ref = FirebaseStorage.instance
    //     .ref()
    //     .child('usersImages')
    //     .child(_name + '.jpg');
    // await ref.putFile(profileImage);
    // url = await ref.getDownloadURL();
    collection.doc(_user.uid) // <-- Doc ID where data should be updated.
        .update({
      "name": nameUserController.text,
      // "imageUrl": url,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: Color(0xffF6F6F6),
        // leading: IconButton(
        //   color: primaryColor,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.close),
        // ),
        // actions: [
        //   IconButton(
        //     onPressed: () async {},
        //     icon: Icon(Icons.check),
        //     color: Colors.blue,
        //   )
        // ],
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "Edit Profile",
          style: primaryTextStyle,
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: FutureBuilder(
          future: GetData.getUser(_user.uid),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("${snapshot.hasError}"),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              var documentData = snapshot.data.data();
              nameUserController =
                  TextEditingController(text: documentData['name']);
              profilePath = documentData['imageUrl'];

              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () async {
                      //     if (profileImage == null) {
                      //       getImage();
                      //     } else {
                      //       profilePath = basename(profileImage.path);
                      //     }
                      //     setState(() {});
                      //   },
                      //   child: Container(
                      //     width: 100,
                      //     height: 100,
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: profileImage != null
                      //         ? ClipRRect(
                      //             borderRadius: BorderRadius.circular(50),
                      //             child: Image.file(
                      //               profileImage,
                      //               height: 100,
                      //               width: 100,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           )
                      //         : ClipRRect(
                      //             borderRadius: BorderRadius.circular(50),
                      //             child: Image.network(
                      //               profilePath,
                      //               fit: BoxFit.cover,
                      //             ),
                      //           ),
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(
                      //     top: 30,
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Text(
                      //         "Nama Lengkap",
                      //         style: primaryTextStyle.copyWith(
                      //           fontSize: 13,
                      //           color: Colors.grey,
                      //         ),
                      //       ),
                      //       TextFormField(
                      //         controller: fullnameController,
                      //         style: primaryTextStyle,
                      //         decoration: InputDecoration(
                      //           hintText: documentData['fullName'],
                      //           hintStyle: primaryTextStyle,
                      //           enabledBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(
                      //               color: Colors.grey,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Pengguna",
                              style: primaryTextStyle.copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            TextFormField(
                              controller:
                                  nameUserController ?? documentData['name'],
                              style: primaryTextStyle,
                              // onChanged: (text) {
                              //   setState(() {
                              //     isDataEdit =
                              //         (text.trim() != documentData['name']
                              //             ? true
                              //             : false);
                              //   });
                              // },
                              decoration: InputDecoration(
                                hintStyle: primaryTextStyle,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alamat Email",
                              style: primaryTextStyle.copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                            AbsorbPointer(
                              child: TextFormField(
                                controller: emailController,
                                style: primaryTextStyle,
                                decoration: InputDecoration(
                                  hintText: documentData['email'],
                                  hintStyle: primaryTextStyle.copyWith(
                                      color: Colors.grey),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.only(
                          top: 16,
                        ),
                        // ignore: deprecated_member_use
                        child: TextButton(
                          onPressed: () async {
                            await updatedProfile();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Data Sudah Di Edit'),
                              ),
                            );
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => MainPage()));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffB12341),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              )),
                          child: Text(
                            "Konfirmasi Edit",
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.only(
                          top: 16,
                        ),
                        // ignore: deprecated_member_use
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          borderSide: BorderSide(color: primaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            "Batal",
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: bold,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: header(),
      resizeToAvoidBottomInset: false,
      body: content(),
    );
  }
}
