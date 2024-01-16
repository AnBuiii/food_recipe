import 'package:flutter/cupertino.dart';

class ProfileWidget extends StatelessWidget {
  final String title;
  final String value;

  const ProfileWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
