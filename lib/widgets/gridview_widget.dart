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
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 9),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final categoryItem = categories[index];
        return Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryItem.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 28,
                  mainAxisSpacing: 24,
                  childAspectRatio: 1.1 / 2.7,
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
            ],
          ),
        );
      },
    );
  }
}
