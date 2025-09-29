import 'package:flutter/foundation.dart';

class ProudectApi {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;
  final double rate;
  final int count;

  ProudectApi({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': {'rate': rate, 'count': count},
    };
  }

  factory ProudectApi.fromJson(Map<String, dynamic> json) {
    return ProudectApi(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rate: (json['rating']['rate'] as num).toDouble(),
      count: json['rating']['count'],
    );
  }
}
