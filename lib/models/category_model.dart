import 'package:cred_app/models/category_item_model.dart';

class Category {
  final String id;
  final String title;
  final List<CategoryItem> items;
  Category({
    required this.id,
    required this.title,
    required this.items,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['template_properties']["header"]["identifier"],
      title: json['template_properties']["header"]["title"],
      items: (json['template_properties']['items'] as List<dynamic>)
          .map((item) => CategoryItem.fromJson(item))
          .toList(),
    );
  }
}
