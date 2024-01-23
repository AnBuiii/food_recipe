import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/common_textfield.dart';
import 'package:food_recipe/feature/home/widget/popular_creator_section.dart';
import 'package:food_recipe/feature/home/widget/popular_section.dart';
import 'package:food_recipe/feature/home/widget/recent_section.dart';
import 'package:food_recipe/feature/home/widget/section_title.dart';
import 'package:food_recipe/utils/widgets/trending_widget.dart';
import 'package:food_recipe/utils/route/app_router.dart';
import 'package:food_recipe/utils/typo.dart';
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
              height: 64,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: const Text(
                    "Find best recipes\nfor cooking",
                    style: h4_bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: CommonTextField(
                textEditingController: searchController,
                isSearch: true,
                hint: 'Search recipe',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const SectionTitle(
              title: "Trending now 🔥",
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 266,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (b, a) {
                  return SizedBox(
                    width: 280,
                    height: 254,
                    child: TrendingWidget(
                      imageUrl: "assets/recipe.png",
                      title: "How to make sushi at home",
                      userImageUrl: "assets/person.png",
                      username: "By Niki Samatha",
                      isSaved: a % 2 == 0,
                      onClick: () {
                        // context.router.push(const RecipeDetailRoute());
                      },
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 16,
                  );
                },
              ),
            ),
            PopularSection((s) {
              //TODO
            }),
            const RecentSection(),
            const PopularCreatorSection()
          ],
        ),
      ),
    );
  }
}

class PositionRetainedScrollPhysics extends ScrollPhysics {
  final Function(double) func;
  final bool shouldRetain;

  const PositionRetainedScrollPhysics({
    super.parent,
    this.shouldRetain = true,
    required this.func,
  });

  @override
  PositionRetainedScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return PositionRetainedScrollPhysics(
      parent: buildParent(ancestor),
      shouldRetain: shouldRetain,
      func: (double) {},
    );
  }

  @override
  double adjustPositionForNewDimensions({
    required ScrollMetrics oldPosition,
    required ScrollMetrics newPosition,
    required bool isScrolling,
    required double velocity,
  }) {
    final position = super.adjustPositionForNewDimensions(
      oldPosition: oldPosition,
      newPosition: newPosition,
      isScrolling: isScrolling,
      velocity: velocity,
    );

    final diff = newPosition.maxScrollExtent - oldPosition.maxScrollExtent;
    func(diff);

    if (oldPosition.pixels > oldPosition.minScrollExtent &&
        diff > 0 &&
        shouldRetain) {
      return position + diff;
    } else {
      return position;
    }
  }
}
