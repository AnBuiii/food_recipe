import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class TrendingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String userImageUrl;
  final String username;

  const TrendingWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.userImageUrl,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(imageUrl),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: paragraph_bold,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
          ],
        ),
        Row(
          children: [
            Image.asset(userImageUrl),
            const SizedBox(
              width: 8,
            ),
            Text(
              username,
              style: small_regular.copyWith(color: neutral40),
            )
          ],
        )
      ],
    );
  }
}
