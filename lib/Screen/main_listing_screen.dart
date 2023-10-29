import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/add_to_cart_screen.dart';
import 'package:velocitybloom/Screen/application_product_const.dart';
import 'package:velocitybloom/Screen/product_description_screen.dart';
import 'package:velocitybloom/Screen/product_modal.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  String filter = '';
  List<ListingScreenProductMenuModal> productModalData =
      ListingScreenProductMenuModalConst.listOfProductInListingScreen;
  List<ListingScreenProductMenuModal> filteredProducts = [];
  String selectedCategory = '';
  List<String> categoryList = [];
  List<String> recentlyViewedList = [];

  double calculateDiscountedPrice(String productPrice, String discount) {
    double doubleProductPrice = double.parse(productPrice);
    double doubleDiscount = double.parse(discount);
    if (doubleDiscount >= 0 && doubleDiscount <= 100) {
      double discountedPrice =
          doubleProductPrice - (doubleProductPrice * (doubleDiscount / 100));
      return discountedPrice;
    } else {
      return doubleProductPrice;
    }
  }

  void addToRecentlyViewed(String item) {
    setState(() {
      recentlyViewedList.add(item);
      if (recentlyViewedList.length > 5) {
        recentlyViewedList.removeAt(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    filteredProducts = productModalData;
    categoryList = getCategories();
  }

  void filterProducts() {
    setState(() {
      filteredProducts = productModalData
          .where((product) =>
              product.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Velocity Bloom',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddToCartScreen()));
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildSearchRow(),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.55,
              ),
              itemCount: filteredProducts.length,
              itemBuilder: (BuildContext context, int index) {
                double finalPrice = calculateDiscountedPrice(
                    productModalData[index].price,
                    productModalData[index].discount);
                final product = filteredProducts[index];
                double productPrice = double.parse(product.price);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDescriptionPage(
                          id: product.id,
                          image: product.image,
                          title: product.title,
                          subTitle: product.subTitle,
                          description: product.description,
                          highlights: product.highlights,
                          category: product.category,
                          subCategory: product.subCategory,
                          seller: product.seller,
                          starRating: product.starRating,
                          rating: product.rating,
                          reviews: product.reviews,
                          sellingPrice: product.sellingPrice,
                          price: product.price,
                          deliveryType: product.deliveryType,
                          discount: product.discount,
                          offers: product.offers,
                          finalPrice: finalPrice.toString(),
                          index: index),
                    ));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(fit: StackFit.loose, children: [
                            Center(
                              child: Image.asset(
                                product.image,
                                height: 120,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Positioned(
                              bottom: 7,
                              left: 3,
                              child: Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                  child: Text(
                                    '${product.starRating}\u2605',
                                    style: const TextStyle(
                                        overflow: TextOverflow.visible,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  product.title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            '\u{20B9}${productPrice.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                        Text(
                                          '${product.discount}%',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '\u{20B9}${finalPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      product.offers,
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextField(
              textAlignVertical: TextAlignVertical.bottom,
              onSubmitted: (value) {
                setState(() {
                  filter = value;
                  filterProducts();
                });
              },
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      filterProducts();
                    },
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            _showFilterDialog();
          },
        ),
        if (selectedCategory.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              setState(() {
                selectedCategory = '';
                filterProductsByCategory(selectedCategory);
              });
            },
          ),
      ],
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Select Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: categoryList.map((category) {
              return ListTile(
                title: Text(category),
                onTap: () {
                  setState(() {
                    selectedCategory = category;
                    filterProductsByCategory(selectedCategory);
                  });
                  Navigator.of(context).pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  List<String> getCategories() {
    return productModalData.map((product) => product.category).toSet().toList();
  }

  void filterProductsByCategory(String category) {
    setState(() {
      if (category.isEmpty) {
        filteredProducts = productModalData;
      } else {
        filteredProducts = productModalData
            .where((product) => product.category == category)
            .toList();
      }
    });
  }
}
