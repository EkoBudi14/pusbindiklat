import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/card_juara.dart';

class PrestasiSdPage extends StatelessWidget {
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
            child: CardJuaraSd(),
          ),
        ],
      ),
    );
  }
}
