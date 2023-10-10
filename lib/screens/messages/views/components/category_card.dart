import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/theme/color_manager.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.isSelected,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: isSelected ? ColorManager.mainColor : ColorManager.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Center(
          child: Text(
            title,
            style: context.textTheme.bodySmall!.copyWith(
              color: isSelected
                  ? ColorManager.whiteColor
                  : ColorManager.darkBlueColor,
            ),
          ),
        ),
      ),
    );
  }
}
