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

  factory ProudectApi.fromJson(Map<String, dynamic> json) => ProudectApi(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    price: json['price'],
    category: json['category'],
    image: json['image'],
    rate: json['rating']['rate'],
    count: json['rating']['count'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rate': rate,
      'count': count,
    };
  }
}
