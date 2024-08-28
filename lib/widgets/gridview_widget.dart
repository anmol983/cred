import 'package:cred_app/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:cred_app/models/category_model.dart';
import 'package:cred_app/widgets/category_card.dart';
import 'package:provider/provider.dart';

class GridviewWidget extends StatelessWidget {
  final List<Category> categories;
  final bool isGridView;

  GridviewWidget({Key? key, required this.categories, required this.isGridView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 16), // Adjusted padding
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categoryItem = categories[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 8), // Added spacing between title and grid
              child: Text(
                categoryItem.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 12, // Reduced cross-axis spacing
                mainAxisSpacing: 12, // Reduced main-axis spacing
                childAspectRatio: 1 / 2.5, // Maintained aspect ratio
              ),
              itemCount: categoryItem.items.length,
              itemBuilder: (context, index) {
                final item = categoryItem.items[index];
                return GestureDetector(
                  onTap: () {
                    Provider.of<CategoryProvider>(context, listen: false)
                        .selectCategory(item);
                    Navigator.of(context).pop();
                  },
                  child: CategoryCard(
                    categoryItem: item,
                    isGrid: isGridView,
                  ),
                );
              },
            ),
            const SizedBox(height: 24), // Added spacing after each grid
          ],
        );
      },
    );
  }
}
