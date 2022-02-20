import 'package:clean_architect/features/common/extensions/string_extensions.dart';
import 'package:clean_architect/features/domain/entities/language/BottomNavEntity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/palette.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    Key? key,
    @required this.customNav,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  final List<BottomNavEntity>? customNav;
  final int? selectedIndex;
  final Function(int index)? onTap;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      labelColor: Palette.primaryColor,
      labelStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
      unselectedLabelColor: Colors.grey,
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
      tabs: widget.customNav!
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                text: e.title.translate(context)!,
                icon: Icon(
                  i == widget.selectedIndex ? e.activeIcons : e.defaultIcons,
                  color: i == widget.selectedIndex
                      ? Palette.facebookBlue
                      : Get.isDarkMode
                          ? Colors.grey
                          : Colors.black45,
                  size: 25.0,
                ),
              )))
          .values
          .toList(),
      onTap: widget.onTap,
    );
  }
}
