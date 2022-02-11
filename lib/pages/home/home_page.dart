import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pusbindiklat/pages/Prestasi_page.dart';
import 'package:pusbindiklat/pages/profile_kami_page.dart';
import 'package:pusbindiklat/pages/tata_tertib_page.dart';
import 'package:pusbindiklat/pages/tentang_kami.dart';
import 'package:pusbindiklat/services/webview.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/card_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _foto =
      FirebaseFirestore.instance.collection('foto');

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/logo_ts_bulat.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "PUSBINDIKLAT GEMILANG",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget titleMenu() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 20,
        ),
        child: Text(
          "Menu",
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 18,
          ),
        ),
      );
    }

    Widget cardMenuTatatertib() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TatatertibPage(),
                  ),
                );
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/law.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Tata Tertib',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardMenuPrestasi() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PrestasiPage(),
                  ),
                );
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/trophy.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Prestasi',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardMenuProfileKami() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => WebViewOnline(
                            'https://profilepusbindiklatgemilang.business.site')));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logo_ts_bulat.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Profile Kami',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardMenuTentangKami() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TentangKami(),
                  ),
                );
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logo_ts_putih.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/logo_ts_bulat.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Tentang Kami',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardMenuPendaftaran() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () async {
                openUrlPendaftaran(
                  'https://docs.google.com/forms/d/e/1FAIpQLScWK_0amjoSnOLUj6lVp_p01a8XorN0WkyhO9H82rxOtrgyGQ/viewform',
                );
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/registration.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pendaftaran',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardMenuPendaftaranUlang() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: 140,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () async {
                openUrlPendaftaranUlang(
                    'https://docs.google.com/forms/d/e/1FAIpQLScM_WjaesmT7QIPuczDtzZ2V8YL6NSK8EybSsqWZnbt5HIZmA/viewform');
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/re-registration.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Pendaftaran Ulang',
            textAlign: TextAlign.center,
            style: primaryTextStyle.copyWith(
                fontSize: 14, fontWeight: FontWeight.w600),
          )
        ],
      );
    }

    Widget cardImageMoment() {
      return Container(
        height: 200,
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: [
                  CardImage(),
                  CardImage(),
                  CardImage(),
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      );
    }

    return (MediaQuery.of(context).orientation == Orientation.portrait)
        ? Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  header(),
                  titleMenu(),
                  Flexible(
                    child: Container(
                      height: 210,
                      child: FutureBuilder<QuerySnapshot>(
                          future: _foto.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text("${snapshot.hasError}"),
                                ),
                              );
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data.docs.map((e) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 16, left: 16),
                                        width: 220,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              '${e.data()['image']}',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
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
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardMenuTatatertib(),
                      cardMenuPrestasi(),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardMenuProfileKami(),
                      cardMenuTentangKami(),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      cardMenuPendaftaran(),
                      cardMenuPendaftaranUlang(),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  header(),
                  titleMenu(),
                  Flexible(
                    child: Container(
                      height: 210,
                      child: FutureBuilder<QuerySnapshot>(
                          future: _foto.get(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Scaffold(
                                body: Center(
                                  child: Text("${snapshot.hasError}"),
                                ),
                              );
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data.docs.map((e) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 16, left: 16),
                                        width: 220,
                                        height: 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 4,
                                              offset: Offset(0, 3),
                                            )
                                          ],
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              '${e.data()['image']}',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardMenuTatatertib(),
                          cardMenuPrestasi(),
                          cardMenuProfileKami(),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardMenuTentangKami(),
                          cardMenuPendaftaran(),
                          cardMenuPendaftaranUlang(),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}

Future<void> openUrl(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  if (await launch(url)) {
    await launch(url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}

Future<void> openUrlPendaftaran(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  if (await launch(url)) {
    await launch(url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}

Future<void> openUrlPendaftaranUlang(String url,
    {bool forceWebView = false, bool enableJavaScript = false}) async {
  if (await launch(url)) {
    await launch(url,
        forceWebView: forceWebView, enableJavaScript: enableJavaScript);
  }
}
