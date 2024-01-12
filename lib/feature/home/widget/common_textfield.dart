import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const CommonTextField({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
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
