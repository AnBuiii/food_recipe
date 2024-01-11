import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../colors.dart';
import '../typo.dart';

class PopularSection extends HookConsumerWidget {
  final Function(String) onChangeCategory;
  const PopularSection(this.onChangeCategory, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories =
    ["Salad", "Break fast", "Appetizer", "Noodle", "Lunch"].toList();
    final selectedCategory = useState("");
    return Column(
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Popular category",
                style: h5,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 34,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, idx) {
                final selected = categories[idx] == selectedCategory.value;
                return Container(
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: selected ? primaryColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    onTap: () {
                      if(selected) selectedCategory.value = "";
                      else selectedCategory.value = categories[idx];
                      onChangeCategory(selectedCategory.value); //
                    },
                    child: Text(
                      categories[idx],
                      style: small_bold.copyWith(
                          color: selected ? Colors.white : primaryColor),
                    ),
                  ),
                );

              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 8);
              },
              itemCount: categories.length),
        )
      ],
    );
  }



}
