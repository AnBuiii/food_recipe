import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationWidget extends ConsumerWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: neutral10,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.ac_unit),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New recipe"),
                Text(
                    "Far far away, behind the word mountains, kfar from the countries.")
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