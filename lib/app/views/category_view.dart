import 'package:bytedev/core/theme/app_theme.dart';
import 'package:bytedev/core/widgets/homepage_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CategoryView extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final bool isCircular;

  const CategoryView({
    super.key,
    required this.categories,
    this.isCircular = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppTheme.brightTeal,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(left: 25),
          child: Center(
            child: IconButton(
              iconSize: 20,
              icon: const Icon(Icons.arrow_back, color: AppTheme.softWhite),
              onPressed: () => Get.back(), // Use GetX back navigation
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            color: AppTheme.softBlack,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search for categories",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 40,
                    minHeight: 40,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: AppTheme.lightgrey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length, // Full list
                itemBuilder: (context, index) {
                  return CategoryCard(
                    title: categories[index]['title'],
                    image: categories[index]['image'],
                    isCircular: isCircular,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
