import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      width: 220,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3),
          )
        ],
        image: DecorationImage(
          image: AssetImage(
            'assets/kumpul.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
