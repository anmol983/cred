import 'package:cred_app/models/category_item_model.dart';
import 'package:cred_app/widgets/image_container.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItem categoryItem;
  final bool isGrid;
  const CategoryCard(
      {Key? key, required this.categoryItem, required this.isGrid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isGrid
        ? Row(
            children: [
              ImageContainer(
                  imageUrl: categoryItem.icon, width: 80, height: 80),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryItem.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      categoryItem.description,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              ImageContainer(
                  imageUrl: categoryItem.icon, width: 80, height: 80),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  categoryItem.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
  }
}
