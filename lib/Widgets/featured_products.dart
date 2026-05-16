import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/products_data.dart';
import 'product_card.dart';

class FeaturedProducts extends StatelessWidget {
  final String selectedCategory;

  const FeaturedProducts({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final products = selectedCategory == 'All'
        ? productCatalog
        : productCatalog.where((product) => product.category == selectedCategory).toList();

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = width > 900
            ? 3
            : width > 600
            ? 2
            : 1;
        final childAspectRatio = width > 600 ? 0.78 : 0.95;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Featured Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.titleText),
            ),
            const SizedBox(height: 20),
            if (products.isEmpty)
              Center(
                child: Text(
                  'No products in this category yet.',
                  style: TextStyle(color: AppColors.bodyText, fontSize: 16),
                ),
              )
            else
              GridView.builder(
                itemCount: products.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
          ],
        );
      },
    );
  }
}
