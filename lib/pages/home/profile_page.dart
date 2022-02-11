import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/model/user.dart';
import 'package:pusbindiklat/pages/edit_profile_page.dart';
import 'package:pusbindiklat/services/auth_services.dart';
import 'package:pusbindiklat/services/get_data.dart';
import 'package:pusbindiklat/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Users users = Users();
  User _user = FirebaseAuth.instance.currentUser;
  // User user = Users.fromDocument();
  final CollectionReference _userRef =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    // TODO: implement initState
    GetData.getUser(_user.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        backgroundColor: Color(0xffF6F6F6),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: primaryTextStyle,
        ),
      );
    }

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Scaffold(
            appBar: header(),
            backgroundColor: Color(0xffF6F6F6),
            body: SafeArea(
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

                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              top: 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Container(
                                //   width: 100,
                                //   height: 100,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(50),
                                //       image: DecorationImage(
                                //         image: NetworkImage(
                                //             documentData['imageUrl']),
                                //         fit: BoxFit.cover,
                                //       )),
                                // ),

                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  documentData['name'],
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: medium,
                                    fontSize: 25,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  documentData['email'],
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: light,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  'Tabungan anda Rp.10,000',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: bold,
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => EditProfile(),
                                            ));
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 28, right: 10),
                                            child: Icon(
                                              Icons.account_circle_outlined,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Edit Profile",
                                            style: primaryTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(
                                                email: documentData['email']
                                                    .toString());
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Permintaan Sudah Dikirim"),
                                                content: Text(
                                                    "Silahkan Periksa Email Anda, Untuk Mengganti Password. Dan Silahkan Login Ulang."),
                                                actions: [
                                                  // ignore: deprecated_member_use
                                                  RaisedButton(
                                                      color: Colors.white,
                                                      elevation: 0,
                                                      child: Text("Ok"),
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
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 28, right: 10),
                                            child: Icon(
                                              Icons.password_outlined,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Ganti Password",
                                            style: primaryTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await AuthServices.signOut();
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                                left: 30, right: 10),
                                            child: Icon(
                                              Icons.logout,
                                              size: 30,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Keluar",
                                            style: primaryTextStyle.copyWith(
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
            ),

            // content()
          )
        : Scaffold(
            backgroundColor: Color(0xffF6F6F6),
            body: FutureBuilder(
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

                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //   width: 100,
                              //   height: 100,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(50),
                              //     image: DecorationImage(
                              //       image:
                              //           NetworkImage(documentData['imageUrl']),
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                documentData['name'],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: medium,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                documentData['email'],
                                style: primaryTextStyle.copyWith(
                                  fontWeight: light,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'Tabungan anda Rp.10,000',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: bold,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                height: 10,
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EditProfile(),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 10),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            size: 30,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Edit Profile",
                                          style: primaryTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => EditProfile(),
                                          ));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 10),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            size: 30,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Edit Profile",
                                          style: primaryTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await AuthServices.signOut();
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 10),
                                          child: Icon(
                                            Icons.logout,
                                            size: 30,
                                            color: primaryColor,
                                          ),
                                        ),
                                        Text(
                                          "Keluar",
                                          style: primaryTextStyle.copyWith(
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

            // content()
          );
  }
}
