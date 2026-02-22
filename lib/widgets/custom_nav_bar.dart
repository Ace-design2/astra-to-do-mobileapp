import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int? _pressedIndex;

  @override
  Widget build(BuildContext context) {
    final navItems = [
      (icon: CupertinoIcons.sun_max_fill, label: 'My Day'),
      (icon: CupertinoIcons.chat_bubble, label: 'Chat'),
      (icon: CupertinoIcons.graph_square, label: 'Insights'),
      (icon: CupertinoIcons.calendar, label: 'Calendar'),
      (icon: CupertinoIcons.person_solid, label: 'Profile'),
    ];

    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 20.0,
          sigmaY: 20.0,
        ), // Deep liquid glass blur
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: ShapeDecoration(
            color: CupertinoColors.systemBackground
                .resolveFrom(context)
                .withOpacity(0.15), // Adaptive light/dark glass
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(
                  0xFF667085,
                ).withOpacity(0.4), // Soft outer border
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(navItems.length, (index) {
              final isSelected = widget.currentIndex == index;
              final isPressed = _pressedIndex == index;
              final item = navItems[index];

              return GestureDetector(
                onTapDown: (_) => setState(() => _pressedIndex = index),
                onTapUp: (_) {
                  setState(() => _pressedIndex = null);
                  widget.onTap(index);
                },
                onTapCancel: () => setState(() => _pressedIndex = null),
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 0 : 6,
                    right: index == navItems.length - 1 ? 0 : 6,
                  ),
                  child: AnimatedScale(
                    scale: isPressed
                        ? 0.90
                        : 1.0, // iOS native shrinking on press
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.easeOutBack, // Bouncy scale release
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOutCubic, // Smooth slide
                      padding: isSelected
                          ? const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            )
                          : const EdgeInsets.all(12),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: isSelected
                            ? const Color(0xFFC1121F)
                            : Colors.transparent, // Primary App Red
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: isSelected
                                ? const Color(0xFFC1121F)
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            item.icon,
                            size: 24,
                            color: isSelected
                                ? CupertinoColors.white
                                : CupertinoColors
                                      .systemGrey, // Adaptive neutral
                          ),
                          AnimatedSize(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.easeOutCubic,
                            alignment: Alignment.topCenter,
                            child: isSelected
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 2.0),
                                    child: Text(
                                      item.label,
                                      style: const TextStyle(
                                        color: CupertinoColors.white,
                                        fontSize: 10,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
