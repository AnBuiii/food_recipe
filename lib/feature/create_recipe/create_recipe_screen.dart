import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/create_recipe/widget/CreateInfoWidget.dart';
import 'package:food_recipe/feature/create_recipe/widget/add_ingredient_widget.dart';
import 'package:food_recipe/feature/home/widget/common_textfield.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class CreateRecipeScreen extends HookConsumerWidget {
  const CreateRecipeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final itemName = useTextEditingController();
    final quantity = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: Stack(
        children: [

          SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    Text("Create recipe"),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/create_image.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: CommonTextField(
                    textEditingController: nameController,
                    isSearch: false,
                  ),
                ),
                const CreateInfoWidget(),
                const SizedBox(
                  height: 12,
                ),
                const CreateInfoWidget(),
                const Row(
                  children: [Text("Ingredients")],
                ),
                const AddIngredientWidget(),
                const SizedBox(
                  height: 12,
                ),
                const AddIngredientWidget(),
                const SizedBox(
                  height: 12,
                ),
                const AddIngredientWidget(),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: CommonTextField(
                          textEditingController: nameController,
                          isSearch: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        flex: 1,
                        child: CommonTextField(
                          textEditingController: itemName,
                          isSearch: false,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          child: const Icon(Icons.add)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Wrap(
                        direction: Axis.horizontal,
                        children: [
                          Icon(Icons.add),
                          Text("Add new ingredients"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column (
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        width: double.infinity,
                        child: const Text(
                          "Save my recipe",
                          textAlign: TextAlign.center,
                          style: bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
