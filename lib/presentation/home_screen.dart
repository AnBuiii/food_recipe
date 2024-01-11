import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:food_recipe/utils/widget/common_textfield.dart';
import 'package:food_recipe/utils/widget/popular_section.dart';
import 'package:food_recipe/utils/widget/recent_section.dart';
import 'package:food_recipe/utils/widget/trending_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 44,
            ),
            Row(
              children: [
                Align(
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 22, bottom: 20),
                    child: const Text(
                      "Find best recipes\nfor cooking",
                      style: titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: CommonTextField(
                textEditingController: searchController,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Trending now 🔥", style: h5),
                  Row(
                    children: [
                      Text(
                        "See all",
                        style: bodyLarge.copyWith(color: primaryColor),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: primaryColor,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (b, a) {
                  return const TrendingWidget(
                      imageUrl: "assets/recipe.png",
                      title: "How to make sushi at home",
                      userImageUrl: "assets/person.png",
                      username: "By Niki Samatha");
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            PopularSection((s) {
              //TODO
            }),

            RecentSection()
          ],
        ),
      ),
    );
  }
}
