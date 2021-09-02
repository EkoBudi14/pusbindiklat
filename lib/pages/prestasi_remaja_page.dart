import 'package:flutter/material.dart';
import 'package:pusbindiklat/widget/card_juara_remaja.dart';

import '../theme.dart';

class PrestasiRemajaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 25,
            ),
            child: CardJuaraRemaja(),
          ),
        ],
      ),
    );
  }
}
