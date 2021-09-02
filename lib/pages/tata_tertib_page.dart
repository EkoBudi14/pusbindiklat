import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';

class TatatertibPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        elevation: 0,
        centerTitle: true,
        // backgroundColor: Color(0xffF6F6F6),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Tata Tertib",
          style: primaryTextStyle.copyWith(
            fontSize: 18,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                  image: AssetImage("assets/logo_ts_bulat.png"),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "PERATURAN DAN TATA TERTIB PUSAT PEMBINAAN PENDIDIKAN LATIHAN (PUSBINDIKLAT) PENCAK SILAT GEMILANG",
                style: primaryTextStyle.copyWith(
                    fontSize: 15, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "1.  Peserta masih aktif dalam Perguruan Seni Beladiri Tapak Suci Cabang Sawah Besar",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "2.  Setiap siswa GEMILANG harus mendaftar ulang",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "3.  Mengisi biodata, membayar uang pangkal (formulir) Rp. 100.000,- serta bersedia membayar iuran Bulanan Rp. 60.000,- dan infaq Rp. 5.000,-",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "4.  Iuran bulanan dibayar selambat-lambatnya pada minggu pertama dalam sebulan",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "5.  Orangtua/Wali bersedia membayar iuran bulanan selama siswa belum menyatakan keluar dari PUSBINDIKLAT GEMILANG. Orangtua/Wali harus membuat Surat Pernyataan Keluar dari GEMILANG, jika siswa ingin mengundurkan diri dari GEMILANG",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "6.  Jika iuran bulanan belum dibayar, Kami akan memberikan Surat Pemberitahuan kepada Orangtua/Wali",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "7.  Khusus anak Yatim/Piatu tidak dikenakan biaya. Kecuali ada yang menanggung menjadi Orangtua asuh",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "8.  Setiap enam bulan sekali GEMILANG akan di revisi kembali",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "9.  Siswa bersedia mengikuti peraturan yang telah ditetapkan oleh PUSBINDIKLAT GEMILANG",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "10.  Siswa dituntut untuk Disiplin, Rajin, dan Tanggungjawab dalam berlatih",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "11.  Siswa akan dikenakan tindakan kedisiplinan jika melanggar peraturan dalam latihan",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "12.  Siswa dituntut untuk Disiplin, Rajin, dan Tanggungjawab dalam berlatih",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "13.  Orangtua/Wali harus selalu berkoordinasi terhadap Pelatih dan Pengurus PUSBINDIKLAT GEMILANG",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "14.  Siswa dituntut untuk Disiplin, Rajin, dan Tanggungjawab dalam berlatih",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "15.  Apabila siswa cidera, Kami akan memberi Pertolongan Pertama pada Cidera Olahraga (PPCO) dan selebihnya diserahkan kepada Orangtua/Wali",
              style: primaryTextStyle,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xffF6F6F6),
      appBar: header(),
      body: ListView(
        children: [
          content(),
        ],
      ),
    );
  }
}
