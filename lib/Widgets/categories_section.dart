import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CategoriesSection extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.titleText),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: categories.map((category) {
            final isSelected = category == selectedCategory;
            return GestureDetector(
              onTap: () => onCategorySelected(category),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.secondary : AppColors.primary,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: isSelected ? AppColors.secondary : Colors.transparent),
                ),
                child: Text(
                  category,
                  style: TextStyle(color: isSelected ? Colors.white : AppColors.secondary, fontWeight: FontWeight.w600),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
