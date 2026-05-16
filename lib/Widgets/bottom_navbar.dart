import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.08), blurRadius: 18, offset: const Offset(0, 8)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.home, color: AppColors.primary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.heart, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.person, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
