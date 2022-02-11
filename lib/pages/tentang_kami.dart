import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class TentangKami extends StatefulWidget {
  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        title: Text(
          "Tentang Kami",
          style: primaryTextStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      );
    }

    Widget imageHeader() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage("assets/logo_ts_bulat.png"),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 45,
            ),
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage("assets/logo_ts_putih.png"),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
          left: 25,
          right: 25,
        ),
        child: Column(
          children: [
            Text(
              "Tapak Suci Putera Muhammadiyah berdiri pada 31 Juli 1963 di desa Kauman, Yogyakarta dan merupakan organisasi otonom ke-11 dari Organisasi Muhammadiyah. Tapak Suci termasuk dalam 10 Perguruan Historis IPSI, yaitu perguruan yang menunjang tumbuh dan berkembangnya IPSI sebagai organisasi. Tapak Suci berasas Islam, bersumber pada Al Qur'an dan As-Sunnah, dan berjiwa persaudaraan. Tapak Suci Cabang Sawah Besar sendiri mulai aktif saat Pendekar Besar Alm. Muhammad Anas mengembangkan ilmu beladirinya pada tahun 1981. Bapak Pendekar Besar Alm. Muhammad Anas juga mencetak bibit-bibit atlet pada masanya dan dilanjutkan kembali perjuangannya oleh pelatih-pelatih di Sawah Besar hingga saat ini demi terbentuknya regenerasi pesilat yang berprestasi.",
              style: primaryTextStyle.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Hal ini tentunya akan memberikan rasa bangga untuk beliau, pelatih-pelatih senior lainnya, dan Orangtua Siswa yang sudah mempercayakan atlet-atlet atau putera-puterinya yang ingin berprestasi melalui cabang olahraga Pencak Silat melalui kami dengan PUSBINDIKLAT “GEMILANG” yang telah dibentuk untuk memfokuskan bibit-bibit atlet potensial yang direkomendasikan oleh Pelatih yang ada di Tapak Suci Cabang Sawah Besar. Gemilang sendiri berdiri pada 15 Oktober tahun 2014. Pelatih pun sudah memiliki Prestasi yang unggul hingga tingkat Internasional dan memiliki pengalaman melatih secara terprogram dengan keilmuan olahraga yang baik dan benar.",
              style: primaryTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Program-program GEMILANG pun sudah terstruktur sejak awal, yang terdiri dari; Program Latihan Teknik, Latihan Fisik & Sparing. Untuk pengalaman TIM ATLET GEMILANG sudah sering mencapai target dengan meraih Juara Umum di setiap event/kejuaraan dan juga mencetak atlet-atletnya untuk menjadi Juara. Kategori pembentukkan atlet yang ada dalam GEMILANG ada 2, yaitu kategori tanding dan seni. Pembentukkan atlet GEMILANG ini dibina dengan penuh kedisiplinan agar dapat mencetak bibit-bibit unggul baik secara jasmani & rohani.",
              style: primaryTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Satu cita-cita kami yang ingin diwujudkan bersama oleh para Pengurus, Pelatih, Atlet dan Orangtua",
              style: primaryTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(),
      body: ListView(
        children: [
          imageHeader(),
          content(),
        ],
      ),
    );
  }
}
