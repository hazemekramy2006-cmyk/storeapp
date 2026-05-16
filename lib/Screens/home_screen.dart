import 'package:flutter/material.dart';
import 'package:store_app/Widgets/header_section.dart';
import 'package:store_app/Widgets/bottom_navbar.dart';
import 'package:store_app/Widgets/categories_section.dart';
import 'package:store_app/Widgets/featured_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = const ['All', 'Skin Care', 'Makeup', 'Perfumes'];
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontalPadding = width > 600 ? 28.0 : 20.0;

    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 30),
              CategoriesSection(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
              ),
              const SizedBox(height: 30),
              FeaturedProducts(selectedCategory: selectedCategory),
            ],
          ),
        ),
      ),
    );
  }
}
