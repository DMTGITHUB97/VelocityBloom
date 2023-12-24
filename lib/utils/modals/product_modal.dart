
class ListingScreenProductMenuModal {
  late String id;
  late String image;
  late String title;
  late String subTitle;
  late String description;
  late String highlights;
  late String category;
  late String subCategory;
  late String seller;
  late String starRating;
  late String rating;
  late String reviews;
  late String sellingPrice;
  late String price;
  late String deliveryType;
  late String discount;
  late String offers;

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

  ListingScreenProductMenuModal.fromJson(Map<String, dynamic> json){
    id = json['json'] ?? '';
    image = json['image'] ?? '';
    title = json['title'] ?? '';
    subTitle = json['subTitle'] ?? '';
    description = json['description'] ?? '';
    highlights = json['highlights'] ?? '';
    category = json['category'] ?? '';
    subCategory = json['subCategory'] ?? '';
    seller = json['seller'] ?? '';
    starRating = json['starRating'] ?? '';
    rating = json['rating'] ?? '';
    reviews = json['reviews'] ?? '';
    sellingPrice = json['sellingPrice'] ?? '';
    price = json['price'] ?? '';
    deliveryType = json['deliveryType'] ?? '';
    discount = json['discount'] ?? '';
    offers = json['offers'] ?? '';
  }

  Map<String, dynamic> toJson(){
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['subTitle'] =subTitle;
    data['description'] = description;
    data['highlights'] = highlights;
    data['category'] = category;
    data['subCategory'] = subCategory;
    data['seller'] = seller;
    data['starRating'] = starRating;
    data['rating'] = rating;
    data['reviews'] = reviews;
    data['sellingPrice'] = sellingPrice;
    data['price'] = price;
    data['deliveryType'] = deliveryType;
    data['discount'] = discount;
    data['offers'] = offers;
    return data;
  }
}
