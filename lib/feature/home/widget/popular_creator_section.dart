import 'package:flutter/cupertino.dart';
import 'package:food_recipe/feature/home/widget/section_title.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopularCreatorSection extends ConsumerWidget {
  const PopularCreatorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SectionTitle(title: "Popular creators"),
        SizedBox(
          height: 119,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, idx) {
              return SizedBox(
                height: 119,
                width: 75,
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset("assets/person_2.png"),
                    ),
                    const Text("Troyan Smith")
                  ],
                ),
              );
            },
            separatorBuilder: (ctx, idx) {
              return const SizedBox(
                width: 12,
              );
            },
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
