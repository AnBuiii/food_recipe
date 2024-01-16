import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/route/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        DiscoverRoute(),
        NotificationRoute(),
        ProfileRoute(),
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: InkWell(
          onTap: () {
            context.router.push(CreateRecipeRoute());
          },
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    tabsRouter.setActiveIndex(0);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    //darken the icon if it is selected or else give it a different color
                    color: tabsRouter.activeIndex == 0
                        ? Colors.blue.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    tabsRouter.setActiveIndex(1);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    //darken the icon if it is selected or else give it a different color
                    color: tabsRouter.activeIndex == 1
                        ? Colors.blue.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    tabsRouter.setActiveIndex(2);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    //darken the icon if it is selected or else give it a different color
                    color: tabsRouter.activeIndex == 2
                        ? Colors.blue.shade900
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    tabsRouter.setActiveIndex(3);
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.home,
                    //darken the icon if it is selected or else give it a different color
                    color: tabsRouter.activeIndex == 3
                        ? Colors.blue.shade900
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
