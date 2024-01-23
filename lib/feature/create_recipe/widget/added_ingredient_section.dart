import 'package:flutter/material.dart';
import 'package:food_recipe/feature/create_recipe/provider/add_ingredient_provider.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddedIngredientSection extends ConsumerWidget {
  const AddedIngredientSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final added_ingredients = ref.watch(added_ingredient_provider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Ingredients",
                style: h5,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, idx) {
              final newKey = Key(added_ingredients[idx].id);
              return AddIngredientWidget(
                key: newKey,
                pair: added_ingredients[idx],
                onRemove: () {
                  ref.read(added_ingredient_provider.notifier).remove(idx);
                },
              );
            },
            separatorBuilder: (ctx, idx) {
              final newKey = Key("separator${added_ingredients[idx].id}");
              return SizedBox(
                key: newKey,
                height: 16,
              );
            },
            itemCount: added_ingredients.length,
            findChildIndexCallback: (key) {
              final valueKey = key as ValueKey;

              var add = 0;
              if ((valueKey.value as String).startsWith("separate")) {
                add = 1;
              }
              var index = added_ingredients
                  .indexWhere((item) => item.id == valueKey.value);
              if (index == -1) return null;

              return index * 2 + add;
            },
          ),
        ],
      ),
    );
  }
}

class AddIngredientWidget extends StatelessWidget {
  final Pair pair;
  final Function() onRemove;

  const AddIngredientWidget(
      {super.key, required this.pair, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: neutral20),
            ),
            child: Text(
              pair.first,
              style: label_regular,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: neutral20),
            ),
            child: Text(
              pair.second,
              style: label_regular,
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () {
            onRemove();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 2)),
            child: const Icon(Icons.remove),
          ),
        )
      ],
    );
  }
}
