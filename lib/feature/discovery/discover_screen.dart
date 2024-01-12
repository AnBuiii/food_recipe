import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/trending_widget.dart';
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
          height: 60,
        ),
        const Text("Saved recipes"),
        TabBar(
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
        Expanded(
          child: TabBarView(controller: tabController, children: [
            SizedBox(
              height: 300,
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, idx) {
                    return const TrendingWidget(
                        imageUrl: "assets/recipe.png",
                        title: "How to make sushi at home",
                        userImageUrl: "assets/person.png",
                        username: "By Niki Samatha");
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 3),
            ),
            Container(
              height: 300,
            ),
          ]),
        )
      ],
    );
  }
}
