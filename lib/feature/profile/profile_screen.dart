import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/trending_widget.dart';
import 'package:food_recipe/feature/profile/widget/ProfileWidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    return NestedScrollView(
      headerSliverBuilder: (c, s) {
        return [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 44,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("My profile"),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_horiz))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          "assets/person.png",
                          fit: BoxFit.fill,
                        )),
                    TextButton(
                        onPressed: () {}, child: const Text("Edit profile"))
                  ],
                ),
                const Row(
                  children: [
                    Text("Alessandra Blair"),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Hello world I’m Alessandra Blair, I’m from Italy 🇮🇹 I love cooking so much!",
                      ),
                    )
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileWidget(title: "Recipe", value: "3"),
                    ProfileWidget(title: "Recipe", value: "3"),
                    ProfileWidget(title: "Recipe", value: "3"),
                    ProfileWidget(title: "Recipe", value: "3")
                  ],
                ),
                Divider(),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              tabs: const [
                Tab(
                  text: "Video",
                ),
                Tab(
                  text: "Recipe",
                ),
              ],
              controller: tabController,
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: tabController,
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                return TrendingWidget(
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
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                return TrendingWidget(
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
        ],
      ),
    );
  }
}
