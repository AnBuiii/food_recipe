import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationSection extends ConsumerWidget {
  const InformationSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/recipe.png",
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                "4,5",
                style: label_bold,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "(300 Reviews)",
                style: label_regular.copyWith(color: neutral40),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/person.png",
                    width: 41,
                    height: 41,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Roberta Anny",
                        style: paragraph_bold,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: primaryColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Bali, Indonesia",
                            style: label_regular.copyWith(color: neutral40),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Follow",
                    style: label_bold.copyWith(color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
