class Listing {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final List<String> images;
  final String? phone;
  final String? whatsapp;
  final DateTime createdAt;
  final bool isApproved;

  Listing({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.images,
    this.phone,
    this.whatsapp,
    required this.createdAt,
    this.isApproved = false,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      images: List<String>.from(json['images'] ?? []),
      phone: json['phone'],
      whatsapp: json['whatsapp'],
      createdAt: DateTime.parse(json['created_at']),
      isApproved: json['is_approved'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'images': images,
      'phone': phone,
      'whatsapp': whatsapp,
      'created_at': createdAt.toIso8601String(),
      'is_approved': isApproved,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String icon;

  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'] ?? 'category',
    );
  }
}
