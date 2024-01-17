import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/utils/route/app_router.dart';
import 'package:food_recipe/utils/typo.dart';

import '../home/widget/big_button.dart';

@RoutePage()
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final route = AutoRouter.of(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/onboard.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 8,),
                      Text(
                        "60k+ ",
                        style: paragraph_bold.copyWith(color: Colors.white),
                      ),
                      Text(
                        "Premium recipes",
                        style: paragraph_regular.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    // height: 274,
                    width: 260,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Let's Cooking",
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 56,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          "Find best recipes for cooking",
                          style:
                              paragraph_regular.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        BigButton(
                          onClick: () {
                            route.replace(const MainRoute());
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
