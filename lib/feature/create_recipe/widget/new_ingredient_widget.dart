import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/common_textfield.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/add_ingredient_provider.dart';

class NewIngredientSection extends HookConsumerWidget {
  const NewIngredientSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemName = useTextEditingController();
    final quantity = useTextEditingController();
    void add() {
      ref
          .read(added_ingredient_provider.notifier)
          .addMore(itemName.text, quantity.text);
      itemName.text = "";
      quantity.text = "";
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CommonTextField(
                  textEditingController: itemName,
                  isSearch: false,
                  hint: 'Item name',
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                flex: 1,
                child: CommonTextField(
                    textEditingController: quantity,
                    isSearch: false,
                    hint: 'Quantity'),
              ),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                  add();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2)),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  add();
                },
                child: const Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Icon(
                      Icons.add,
                      size: 24,
                    ),
                    Text(
                      "Add new ingredients",
                      style: paragraph_bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
