import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class TrendingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String userImageUrl;
  final String username;
  final Function() onClick;

  const TrendingWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.userImageUrl,
      required this.username,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: paragraph_bold,
              ),
              IconButton(onPressed: onClick, icon: const Icon(Icons.more_horiz))
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
      ),
    );
  }
}
