import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/card_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
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
                Navigator.pushNamed(context, '/tata-tertib');
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
                Navigator.pushNamed(context, '/prestasi');
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
              onPressed: () {
                Navigator.pushNamed(context, '/profile-kami');
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
                Navigator.pushNamed(context, '/tentang-kami');
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
              onPressed: () {},
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
              onPressed: () {},
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

    return ListView(
      children: [
        (MediaQuery.of(context).orientation == Orientation.portrait)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  header(),
                  cardImageMoment(),
                  titleMenu(),
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
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  header(),
                  cardImageMoment(),
                  SizedBox(
                    height: 30,
                  ),
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
              ),
      ],
    );
  }
}
