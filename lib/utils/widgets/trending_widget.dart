import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/utils/typo.dart';

class TrendingWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String userImageUrl;
  final String username;
  final bool isSaved;
  final Function() onClick;

  const TrendingWidget({super.key,
    required this.imageUrl,
    required this.title,
    required this.userImageUrl,
    required this.username,
    required this.onClick,
    required this.isSaved});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                        color: Color(0x3030304d), shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      "assets/ic_play.svg",
                      width: 16,
                      height: 16,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    margin: const EdgeInsets.only(left: 8, top: 8),
                    decoration: BoxDecoration(
                      color: const Color(0x3030304d),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "4,5",
                          style: label_bold.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      margin: const EdgeInsets.only(bottom: 8, right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0x3030304d),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "15:10",
                        style: small_regular.copyWith(color: Colors.white),
                      )),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, right: 8),
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      isSaved
                          ? "assets/ic_bookmark_active.svg"
                          : "assets/ic_bookmark_inactive.svg",
                      width: 20,
                      height: 20,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: paragraph_bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.more_horiz)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(
                userImageUrl,
                width: 32,
                height: 32,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                username,
                style: small_regular.copyWith(color: neutral40),
              )
            ],
          )
        ],
      ),
    );
  }
}
