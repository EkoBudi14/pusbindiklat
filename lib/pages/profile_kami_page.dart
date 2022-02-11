import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/card_testimoni.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileKami extends StatefulWidget {
  @override
  _ProfileKamiState createState() => _ProfileKamiState();
}

class _ProfileKamiState extends State<ProfileKami> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        title: Text(
          "Profile Kami",
          style: primaryTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      );
    }

    Widget imageCover() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
        ),
        width: 310,
        height: 275,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/kumpul.jpg'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
      );
    }

    Widget testimoni() {
      return Container(
        height: 260,
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  CardTestimoni(
                    star: 5,
                    comment:
                        "Alhamdulillah sekarang sudah ada tempat tetap latihan Tapak Suci Sawah Besar untuk melahirkan calon-calon atlit pencak silat yang akan datang untuk mengharumkan Indonesia, selamat buat pengurus dan pelatih. Semoga berkah buat kita semua",
                    name: "Agus M",
                  ),
                  CardTestimoni(
                    star: 5,
                    comment:
                        "Generasi penerus warisan budaya bangsa Pencak Silat Seni Beladiri Indonesia Tapak Suci Pembinaan Adap ,Aklak Dan mental, Dengan para pelatih yg berprestasi National, Pelayanan yg ramah Dan tempat menyenangkan... Adem",
                    name: "Sriyanto D",
                  ),
                  CardTestimoni(
                    star: 5,
                    comment:
                        "Mantappp,untuk adik\" TS SABES jangan pernah berhenti berkarya pasti kelak akan menuai hasilnya,contohnya kaya kak DINO BS,ayo ikuti jejak kak DINO BS,ayo semangat!kalian pasti bisa dan bisa jadi juara,aamiin",
                    name: "Agung w",
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 30,
        ),
        child: Column(
          children: [
            Text(
              "PUSBINDIKLAT\nGEMILANG",
              style: primaryTextStyle.copyWith(
                fontSize: 25,
                fontWeight: semiBold,
                color: Color(0xffF44042),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Perguruan Bela Diri",
              style: primaryTextStyle,
            ),
            Text(
              "Akan Buka Pukul  15.30",
              style: primaryTextStyle,
            ),
            GestureDetector(
              onTap: () async {
                const url = "https://wa.me/087785201191";
                var encoded = Uri.encodeFull(url);
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 15,
                  bottom: 15,
                ),
                margin: EdgeInsets.only(top: 30),
                width: 232,
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xff06004D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/whatsapp.png',
                      width: 26,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0812-8400-7005",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              width: 95,
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Text(
              "Testimoni",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(
          left: 25,
          right: 25,
          top: 20,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              width: 95,
              child: Divider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            Text(
              "Hubungi Kami",
              style: primaryTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kontak",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "0812-8400-7005",
                      style: primaryTextStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Website Kami",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "http://www.tssabes.com/home.html",
                      style: primaryTextStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Alamat",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "jl karang anyar raya, rptra rw 02\njakarta pusat\nDKI Jakarta 10740 Indonesia",
                      style: primaryTextStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jam Buka",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Sen:	15.30–21.00\nSel:	15.30–21.00\nRab:	15.30–20.30\nKam:	15.30–21.00\nJum:	15.30–20.30\nSab:	 Tutup\nMin:	 08.00–12.00",
                      style: primaryTextStyle,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      appBar: header(),
      body: ListView(
        children: [
          imageCover(),
          content(),
          testimoni(),
          footer(),
        ],
      ),
    );
  }
}

