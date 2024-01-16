import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isSearch;

  const CommonTextField(
      {super.key, required this.textEditingController, required this.isSearch});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: isSearch ? const Icon(Icons.search) : null,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: neutral20, width: 1),
          ),
          hintText: 'Search recipes',
          hintStyle: bodySmall.copyWith(color: neutral30)),
    );
  }
}
