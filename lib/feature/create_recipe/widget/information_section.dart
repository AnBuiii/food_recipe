import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_recipe/feature/home/widget/common_textfield.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationSection extends HookConsumerWidget {
  final TextEditingController nameController;

  const InformationSection({super.key, required this.nameController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/create_image.png",
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CommonTextField(
            textEditingController: nameController,
            isSearch: false,
            hint: 'Recipe name',
          ),
          const SizedBox(
            height: 16,
          ),
          const CreateInfoWidget(),
          const SizedBox(
            height: 12,
          ),
          const CreateInfoWidget(),
        ],
      ),
    );
  }
}

class CreateInfoWidget extends StatelessWidget {

  const CreateInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          color: neutral10, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 36,
                width: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.person,
                  color: primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Bread",
                style: paragraph_bold,
              )
            ],
          ),
          Row(
            children: [
              Text(
                "01",
                style: label_regular.copyWith(color: neutral40),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.arrow_forward_sharp)
            ],
          )
        ],
      ),
    );
  }
}

