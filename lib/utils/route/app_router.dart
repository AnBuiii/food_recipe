import 'package:auto_route/auto_route.dart';
import 'package:food_recipe/feature/create_recipe/create_recipe_screen.dart';
import 'package:food_recipe/feature/discovery/discover_screen.dart';
import 'package:food_recipe/feature/home/home_screen.dart';
import 'package:food_recipe/feature/notification/notification_screen.dart';
import 'package:food_recipe/feature/profile/profile_screen.dart';

import '../../feature/onboarding/onboarding_screen.dart';
import '../../feature/recipe_detail/recipe_detail_screen.dart';
import '../../feature/main_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardRoute.page, initial: true),
        AutoRoute(page: RecipeDetailRoute.page),
        AutoRoute(page: CreateRecipeRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: DiscoverRoute.page),
            AutoRoute(page: NotificationRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
