import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';

class CardJuaraRemaja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Ahmad Rifai",
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'JUARA 3 TANDING O2SN',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Jakarta Pusat kelas F Putra',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
