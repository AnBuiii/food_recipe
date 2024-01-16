import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_recipe/feature/notification/widget/notification.dart';
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
          height: 44,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Notifications"),
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
        TabBar(
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
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, idx) {
                      return const NotificationWidget();
                    },
                    separatorBuilder: (ctx, idx) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 10),
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (ctx, idx) {
                      return const NotificationWidget();
                    },
                    separatorBuilder: (ctx, idx) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 3),
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, idx) {
                    return const NotificationWidget();
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
