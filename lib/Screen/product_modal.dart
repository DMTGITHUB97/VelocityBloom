import 'package:flutter/material.dart';

class ProductMenuModal {
  final String id;
  final String name;
  final String category;
  final double price;
  final Color color;
  final String description;

  ProductMenuModal(
      {required this.id,
      required this.name,
      required this.category,
      required this.price,
      required this.color,
      required this.description});
}

class CategoriesMenuModal {
  final String id;
  final String categoryName;
  final String image;

  CategoriesMenuModal(
      {required this.id, required this.categoryName, required this.image});
}

class ListingScreenProductMenuModal {
  final String id;
  final String image;
  final String title;
  final String subTitle;
  final String description;
  final String highlights;
  final String category;
  final String subCategory;
  final String seller;
  final String starRating;
  final String rating;
  final String reviews;
  final String sellingPrice;
  final String price;
  final String deliveryType;
  final String discount;
  final String offers;

  ListingScreenProductMenuModal(
      {required this.id,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.highlights,
      required this.category,
      required this.subCategory,
      required this.seller,
      required this.starRating,
      required this.rating,
      required this.reviews,
      required this.sellingPrice,
      required this.price,
      required this.deliveryType,
      required this.discount,
      required this.offers});
}
