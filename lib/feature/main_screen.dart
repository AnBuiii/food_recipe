import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        height: 48,
        width: 48,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: primaryColor),
        child: InkWell(
          onTap: () {
            context.router.push(const CreateRecipeRoute());
          },
          child: const Icon(Icons.add,size:20 ,color: Colors.white,),
        ),
      ),
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomAppBar(
          elevation: 1,
          shape: const CircularNotchedRectangle(),
          shadowColor: Colors.black,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (tabsRouter.activeIndex == 0)
                    ? GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/ic_home_active.svg",
                          width: 24,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          tabsRouter.setActiveIndex(0);
                        },
                        child: SvgPicture.asset(
                          "assets/ic_home_inactive.svg",
                          width: 24,
                        ),
                      ),
                (tabsRouter.activeIndex == 1)
                    ? GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          "assets/ic_bookmark_active.svg",
                          width: 24,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          tabsRouter.setActiveIndex(1);
                        },
                        child: SvgPicture.asset(
                          "assets/ic_bookmark_inactive.svg",
                          width: 24,
                          color: neutral30,
                        ),
                      ),
                const SizedBox(
                  width: 24,
                ),
                (tabsRouter.activeIndex == 2)
                    ? GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                            "assets/ic_notification_active.svg",
                            width: 24),
                      )
                    : GestureDetector(
                        onTap: () {
                          tabsRouter.setActiveIndex(2);
                        },
                        child: SvgPicture.asset(
                            "assets/ic_notification_inactive.svg",
                            width: 24),
                      ),
                (tabsRouter.activeIndex == 3)
                    ? GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset("assets/ic_profile_active.svg",
                            width: 24),
                      )
                    : GestureDetector(
                        onTap: () {
                          tabsRouter.setActiveIndex(3);
                        },
                        child: SvgPicture.asset(
                            "assets/ic_profile_inactive.svg",
                            width: 24),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
