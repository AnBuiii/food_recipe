import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWidget extends ConsumerWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: neutral10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffCEECD7)),
            child: SvgPicture.asset(
              "assets/ic_notif.svg",
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New recipe!",
                  style: small_bold,
                ),
                Text(
                  "Far far away, behind the word mountains, far from the countries.",
                  style: small_regular.copyWith(color: neutral40),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: primaryColor, shape: BoxShape.circle),
            width: 6,
            height: 6,
          )
        ],
      ),
    );
  }
}
