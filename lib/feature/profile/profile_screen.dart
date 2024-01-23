import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/profile/widget/ProfileWidget.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/random_string.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:food_recipe/utils/widgets/recipe_widget.dart';
import 'package:food_recipe/utils/widgets/trending_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/meals.dart';
import '../home/provider/recipe_providers.dart';

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
                  height: 64,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My profile",
                        style: h4_bold,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 12, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            "assets/profile_avatar.png",
                            fit: BoxFit.fill,
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Edit profile",
                          style: label_bold.copyWith(color: primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Alessandra Blair",
                        style: h5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 100),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Hello world I’m Alessandra Blair, I’m from Italy 🇮🇹 I love cooking so much!",
                          style: label_regular.copyWith(color: neutral40),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileWidget(title: "Recipe", value: "3"),
                      ProfileWidget(title: "Videos", value: "13"),
                      ProfileWidget(title: "Followers", value: "14K"),
                      ProfileWidget(title: "Following", value: "120")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  height: 1,
                ),
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            expandedHeight: 0,
            toolbarHeight: 12,
            bottom: TabBar(
              padding: const EdgeInsets.only(bottom: 12, left: 20, right: 20),
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
          ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: RecipeWidget(Meals(
                        idMeal: getRandomString(4),
                        strMeal: 'OKEOKE',
                        strCategory: '',
                        strArea: '',
                        strInstructions: '',
                        strMealThumb:
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/Ambersweet_oranges.jpg/1200px-Ambersweet_oranges.jpg',
                        strTags: '',
                        strYoutube: '',
                        strIngredient1: '',
                        strIngredient2: '',
                        strIngredient3: '',
                        strIngredient4: '',
                        strIngredient5: '',
                        strMeasure1: '',
                        strMeasure2: '',
                        strMeasure3: '',
                        strMeasure4: '',
                        strMeasure5: '')));
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
