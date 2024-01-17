import 'package:flutter/cupertino.dart';
import 'package:food_recipe/feature/home/widget/section_title.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PopularCreatorSection extends ConsumerWidget {
  const PopularCreatorSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          const SectionTitle(title: "Popular creators"),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 119,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                return SizedBox(
                  width: 75,
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "assets/person_2.png",
                          height: 75,
                          width: 75,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Troyan Smith",
                        style: small_bold,
                        textAlign: TextAlign.center,
                      )
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
      ),
    );
  }
}
