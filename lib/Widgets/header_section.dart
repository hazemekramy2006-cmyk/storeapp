import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../data/products_data.dart';
import '../models/product_model.dart';
import 'product_card.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Good morning', style: TextStyle(fontSize: 16, color: AppColors.bodyText)),
                SizedBox(height: 6),
                Text(
                  'Luvia Beauty',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.titleText),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(16)),
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.cart, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            showSearch<ProductModel?>(context: context, delegate: ProductSearchDelegate(productCatalog));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: const Color.fromRGBO(0, 0, 0, 0.04), blurRadius: 16, offset: const Offset(0, 8)),
              ],
            ),
            child: Row(
              children: const [
                Icon(CupertinoIcons.search, color: AppColors.bodyText),
                SizedBox(width: 12),
                Expanded(
                  child: Text('Search products', style: TextStyle(color: AppColors.bodyText, fontSize: 16)),
                ),
                Icon(CupertinoIcons.arrow_right, color: AppColors.bodyText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProductSearchDelegate extends SearchDelegate<ProductModel?> {
  final List<ProductModel> products;

  ProductSearchDelegate(this.products);

  @override
  String get searchFieldLabel => 'Search products';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: AppColors.titleText);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [if (query.isNotEmpty) IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(CupertinoIcons.back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (results.isEmpty) {
      return Center(
        child: Text('No products found.', style: TextStyle(color: AppColors.bodyText, fontSize: 16)),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: results.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final product = results[index];
        return ProductCard(product: product);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? products
        : products.where((product) {
            return product.name.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final product = suggestions[index];
        return ListTile(
          onTap: () {
            query = product.name;
            showResults(context);
          },
          leading: SizedBox(width: 50, child: Image.asset(product.image, fit: BoxFit.cover)),
          title: Text(product.name),
          subtitle: Text(product.price),
        );
      },
    );
  }
}
