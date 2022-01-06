import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/model/user.dart';
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
      FirebaseFirestore.instance.collection('user');

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
          style: primaryTextStyle.copyWith(
            color: Colors.black,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Alex Herman",
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "@alexkyun",
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
                    Navigator.pushNamed(context, '/edit-profile');
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 30, right: 10),
                        child: Icon(
                          Icons.account_circle_outlined,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "Edit Profile",
                        style: primaryTextStyle.copyWith(fontSize: 16),
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
                        margin: EdgeInsets.only(left: 30, right: 10),
                        child: Icon(
                          Icons.logout,
                          size: 30,
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "Keluar",
                        style: primaryTextStyle.copyWith(fontSize: 16),
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
      );
    }

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Scaffold(
            backgroundColor: Color(0xffF6F6F6),
            appBar: header(),
            body: Container(
              child: Column(
                children: [
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () async {
                      DocumentSnapshot snapshot =
                          await GetData.getUser("1PjLSVbPP318bwUKOhAE");
                      print(snapshot.data()['fullName']);
                    },
                  ),
                ],
              ),
            )
            // content()
            ,
          )
        : Scaffold(
            backgroundColor: Color(0xffF6F6F6),
            appBar: header(),
            body: content(),
          );
  }
}
