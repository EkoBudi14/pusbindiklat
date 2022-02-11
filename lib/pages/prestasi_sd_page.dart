import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/card_juara.dart';

class PrestasiSdPage extends StatefulWidget {
  @override
  _PrestasiSdPageState createState() => _PrestasiSdPageState();
}

class _PrestasiSdPageState extends State<PrestasiSdPage> {
  final CollectionReference _prestasi =
      FirebaseFirestore.instance.collection('prestasiSD');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: FutureBuilder<QuerySnapshot>(
          future: _prestasi.get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("${snapshot.hasError}"),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: snapshot.data.docs.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: defaultMargin, top: 25, right: defaultMargin),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 54,
                            height: 54,
                            child: Image.asset("assets/trophy.png"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "${e.data()['nama']}",
                            style: primaryTextStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "${e.data()['juara']}",
                                  style: primaryTextStyle.copyWith(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "${e.data()['kelas']}",
                                  style: primaryTextStyle.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }
}
