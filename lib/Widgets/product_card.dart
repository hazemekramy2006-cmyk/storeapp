import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../constants/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(aspectRatio: 1, child: Image.asset(product.image, fit: BoxFit.contain)),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            product.name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.titleText),
          ),
          const SizedBox(height: 6),
          Text(
            product.price,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.accent),
          ),
        ],
      ),
    );
  }
}
