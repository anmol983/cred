class CategoryItem {
  final String name;
  final String icon;
  final String description;
  final String id;

  CategoryItem({
    required this.name,
    required this.icon,
    required this.description,
    required this.id,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      name: json['display_data']['name'],
      icon: json['display_data']['icon_url'],
      description: json['display_data']['description'],
      id: json['identifier'],
    );
  }
}
