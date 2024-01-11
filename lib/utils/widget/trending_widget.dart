import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../typo.dart';

class TrendingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String userImageUrl;
  final String username;
  const TrendingWidget({super.key, required this.imageUrl, required this.title, required this.userImageUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 300,
      child: Column(
        children: [
          Image.asset(imageUrl),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text(
                title,
                style: paragraph_bold,
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_horiz))
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
