import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/trending_widget.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DiscoverScreen extends HookConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: const Text(
                "Saved recipes",
                style: h4_bold,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: TabBar(
            dividerColor: Colors.transparent,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: primaryColor,
            ),
            labelStyle: small_bold,
            labelColor: Colors.white,
            unselectedLabelColor: primaryColor,
            tabs: const [
              Tab(
                text: "Video",
              ),
              Tab(
                text: "Recipe",
              )
            ],
            controller: tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              SizedBox(
                height: 300,
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    itemBuilder: (ctx, idx) {
                      return TrendingWidget(
                        imageUrl: "assets/recipe.png",
                        title: "How to make sushi at home",
                        userImageUrl: "assets/person.png",
                        username: "By Niki Samatha",
                        isSaved: true,
                        onClick: () {},
                      );
                    },
                    separatorBuilder: (ctx, idx) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 3),
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, idx) {
                      return TrendingWidget(
                        isSaved: true,
                        imageUrl: "assets/recipe.png",
                        title: "How to make sushi at home",
                        userImageUrl: "assets/person.png",
                        username: "By Niki Samatha",
                        onClick: () {},
                      );
                    },
                    separatorBuilder: (ctx, idx) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 3),
              ),
            ],
          ),
        )
      ],
    );
  }
}
