import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipe/feature/notification/widget/notification.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class NotificationScreen extends HookConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 3);
    return Column(
      children: [
        const SizedBox(
          height: 64,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Notifications",
                style: h4_bold,
              ),
              IconButton(
                color: Colors.black,
                icon: SvgPicture.asset(
                  "assets/ic_filter.svg",
                  semanticsLabel: 'Label',
                ),
                onPressed: () {},
              ),
            ],
          ),
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
                text: "All",
              ),
              Tab(
                text: "Unread",
              ),
              Tab(
                text: "Read",
              ),
            ],
            controller: tabController,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ListView.separated(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 12),
                  shrinkWrap: true,
                  itemBuilder: (ctx, idx) {
                    if (idx == 10) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You're all set!",
                            style: tiny_regular.copyWith(color: neutral40),
                          ),
                        ],
                      );
                    } else {
                      return const NotificationWidget();
                    }
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 10 + 1),
              ListView.separated(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  shrinkWrap: true,
                  itemBuilder: (ctx, idx) {
                    if (idx == 3) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You're all set!",
                            style: tiny_regular.copyWith(color: neutral40),
                          ),
                        ],
                      );
                    } else {
                      return const NotificationWidget();
                    }
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 4),
              ListView.separated(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                shrinkWrap: true,
                itemBuilder: (ctx, idx) {
                  if (idx == 3) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "You're all set!",
                          style: tiny_regular.copyWith(color: neutral40),
                        ),
                      ],
                    );
                  } else {
                    return const NotificationWidget();
                  }

                },
                separatorBuilder: (ctx, idx) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                itemCount: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}
