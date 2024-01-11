import 'package:auto_route/auto_route.dart';
import 'package:food_recipe/presentation/home_screen.dart';

import '../../main.dart';
import '../../presentation/onboarding_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: OnboardRoute.page, path: "/"),
        AutoRoute(page: HomeRoute.page, path: "/home"),
        AutoRoute(page: RouteB.page, path: "/b"),
      ];
}
