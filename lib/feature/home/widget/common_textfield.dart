import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  final bool isSearch;

  const CommonTextField(
      {super.key, required this.textEditingController, required this.isSearch, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: isSearch ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal:16 ),
        prefixIcon: isSearch
            ? SvgPicture.asset(
                "assets/ic_union.svg",
                width: 16,
                height: 16,
                fit: BoxFit.scaleDown,
              )
            : null,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: neutral20, width: 1),
        ),
        hintText: hint,
        hintStyle: label_regular.copyWith(color: neutral30),
      ),
      style: label_regular ,
    );
  }
}
