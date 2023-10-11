import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:messaging_app/core/theme/color_manager.dart';
import 'package:messaging_app/core/widgets/custom_image.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key? key,
    required this.isFromOthers,
    required this.isAdmin,
    required this.message,
    required this.userName,
    required this.date,
    this.images,
  }) : super(key: key);

  final bool isFromOthers;
  final bool isAdmin;
  final String message;
  final String userName;
  final DateTime date;
  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: images != null ? context.width * 0.6 : context.width * 0.7,
      ),
      child: images != null
          ? StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: images!
                  .map((e) => StaggeredGridTile.count(
                        crossAxisCellCount: e == images!.first ? 2 : 1,
                        mainAxisCellCount: 1,
                        child: CustomImage(path: e),
                      ))
                  .toList(),
            )
          : Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(8),
                  topRight: const Radius.circular(8),
                  bottomRight:
                      isFromOthers ? const Radius.circular(8) : Radius.zero,
                  bottomLeft:
                      isFromOthers ? Radius.zero : const Radius.circular(8),
                ),
                color: isFromOthers
                    ? ColorManager.hintTextColor.withOpacity(.05)
                    : ColorManager.mainColor,
              ),
              child: Column(
                children: [
                  if (userName.isNotEmpty) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userName,
                          style: context.textTheme.headlineMedium!.copyWith(
                            color: ColorManager.orangeColor,
                          ),
                        ),
                        if (isAdmin)
                          Text(
                            'admin',
                            style: context.textTheme.headlineSmall!.copyWith(
                              color: ColorManager.hintTextColor.withOpacity(.5),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  Text(
                    message,
                    style: TextStyle(
                      color: isFromOthers ? null : ColorManager.whiteColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${date.minute}.${date.second < 10 ? '0${date.second}' : date.second}',
                        style: TextStyle(
                          color: isFromOthers
                              ? ColorManager.hintTextColor.withOpacity(.5)
                              : ColorManager.whiteColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
