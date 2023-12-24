import 'package:flutter/material.dart';
import 'package:velocitybloom/presentation/add_to_cart_screen.dart';
import 'package:velocitybloom/presentation/payment/payment_service.dart';

class ProductDescriptionPage extends StatefulWidget {
  int index;
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
  final String finalPrice;

  ProductDescriptionPage(
      {Key? key,
      required this.index,
      required this.id,
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
      required this.offers,
      required this.finalPrice})
      : super(key: key);

  @override
  State<ProductDescriptionPage> createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: _getBodyContent(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _getFloatingButtonBar());
  }

  Widget _getBodyContent() {
    double finalPriceValue = double.parse(widget.finalPrice);
    double productPrice = double.parse(widget.price);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Container(
          color: Colors.white10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(fit: StackFit.loose, children: [
                        Center(
                          child: Image.asset(
                            widget.image,
                            width: 300,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(Icons.favorite_border)),
                        const Positioned(
                            top: 50, right: 10, child: Icon(Icons.share))
                      ]),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Text(
                        'Select Variant',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                child: ListTile(
                    leading: Icon(
                      Icons.invert_colors,
                      color: Colors.blue,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Color: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text('Purple',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Text(
                          '4 more',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    )),
              ),
              const Card(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                child: ListTile(
                    leading: Icon(
                      Icons.sd_storage,
                      color: Colors.blue,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Storage: ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text('512 GB',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Text(
                          '3 more',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.black,
                    )),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          '\u{20B9}${finalPriceValue.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Text('\u{20B9}${productPrice.toStringAsFixed(2)}',
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '${widget.discount}% Off',
                              style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 8.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                      Text('${widget.description}% Off'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      title: SizedBox(
        height: 45,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    ),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerRight,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddToCartScreen()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFloatingButtonBar() {
    double finalPriceValue = double.parse(widget.finalPrice);
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(color: Colors.white),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddToCartScreen(
                          id: widget.id,
                          title: widget.title,
                          image: widget.image,
                          subTitle: widget.subTitle,
                          description: widget.description,
                          highlights: widget.highlights,
                          category: widget.category,
                          subCategory: widget.subCategory,
                          seller: widget.seller,
                          starRating: widget.starRating,
                          rating: widget.rating,
                          reviews: widget.reviews,
                          sellingPrice: widget.sellingPrice,
                          price: widget.price,
                          deliveryType: widget.deliveryType,
                          discount: widget.discount,
                          offers: widget.offers,
                          finalPrice: widget.finalPrice,
                        )));
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  iconColor: MaterialStateProperty.all(Colors.black)),
              child: const Icon(Icons.add_shopping_cart),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      'Pay in EMI',
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  PaymentService.openPaymentGateway(finalPriceValue, widget.id);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
