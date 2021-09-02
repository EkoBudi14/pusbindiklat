import 'package:flutter/material.dart';
import 'package:pusbindiklat/theme.dart';
import 'package:pusbindiklat/widget/rating_stars.dart';

class CardTestimoni extends StatelessWidget {
  final double star;
  final String comment;
  final String name;

  CardTestimoni({this.star, this.comment, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      padding: EdgeInsets.all(15),
      width: 247,
      height: 375,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingStars(star),
          SizedBox(
            height: 10,
          ),
          Text(
            comment,
            style: primaryTextStyle.copyWith(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: primaryTextStyle.copyWith(
              fontSize: 13,
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }
}
