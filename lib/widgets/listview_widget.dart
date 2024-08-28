import 'package:cred_app/provider/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:cred_app/models/category_model.dart';
import 'package:cred_app/widgets/category_card.dart';
import 'package:provider/provider.dart';

class ListviewWidget extends StatelessWidget {
  final List<Category> categories;
  final bool isGridView;

  ListviewWidget({Key? key, required this.categories, required this.isGridView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categoryItem = categories[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryItem.title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
          ],
        );
      },
    );
  }
}
