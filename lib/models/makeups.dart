// To parse this JSON data, do
//
//     final makeups = makeupsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Makeups {
  Makeups({
    required this.id,
    required this.brand,
    required this.name,
    required this.price,
    required this.priceSign,
    required this.currency,
    required this.imageLink,
    required this.productLink,
    required this.websiteLink,
    required this.description,
    required this.rating,
    required this.category,
    required this.productType,
    required this.tagList,
    required this.createdAt,
    required this.updatedAt,
    required this.productApiUrl,
    required this.apiFeaturedImage,
  });

  final int id;
  final brand;
  final String name;
  final String price;
  final dynamic priceSign;
  final dynamic currency;
  final String imageLink;
  final String productLink;
  final String websiteLink;
  final String description;
  final double rating;
  final String category;
  final String productType;
  final List<dynamic> tagList;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String productApiUrl;
  final String apiFeaturedImage;
}
