import 'package:flutter/material.dart';
import 'package:velocitybloom/Screen/payment/payment_service.dart';

class AddToCartScreen extends StatefulWidget {
  late String isFrom;
  int? index;
  late String? id;
  late String? image;
  late String? title;
  late String? subTitle;
  late String? description;
  late String? highlights;
  late String? category;
  late String? subCategory;
  final String? seller;
  final String? starRating;
  final String? rating;
  final String? reviews;
  final String? sellingPrice;
  final String? price;
  final String? deliveryType;
  final String? discount;
  final String? offers;
  final String? finalPrice;

  AddToCartScreen(
      {Key? key,
      this.id,
      this.image,
      this.title,
      this.subTitle,
      this.description,
      this.highlights,
      this.category,
      this.subCategory,
      this.seller,
      this.starRating,
      this.rating,
      this.reviews,
      this.sellingPrice,
      this.price,
      this.deliveryType,
      this.discount,
      this.offers,
      this.finalPrice})
      : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  String selectedQuantity = '1';
  String moreQuantity = '';

  @override
  Widget build(BuildContext context) {
    var price = widget.price ?? '0';
    var finalPrice = widget.finalPrice ?? '0';
    double numPrice = double.parse(price);
    double finalPriceInNum = double.parse(finalPrice);
    double totalPaymentAmount = double.parse(finalPrice);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _getMyCartBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.white,
        height: 60,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      numPrice.toStringAsFixed(2),
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    ),
                    Text(
                      finalPriceInNum.toStringAsFixed(2),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 170,
                child: ElevatedButton(
                  onPressed: () {
                    PaymentService.openPaymentGateway(
                        totalPaymentAmount, widget.id ?? '0');
                  },
                  //     () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => PaymentScreen(
                  //             seller: widget.seller,
                  //             starRating: widget.starRating,
                  //             rating: widget.rating,
                  //             reviews: widget.reviews,
                  //             sellingPrice: widget.sellingPrice,
                  //             price: widget.price,
                  //             deliveryType: widget.deliveryType,
                  //             discount: widget.discount,
                  //             offers: widget.offers,
                  //             finalPrice: widget.finalPrice,
                  //           )));
                  // },
                  child: const Text(
                    'Place order',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getMyCartBody() {
    var discountPrice = widget.discount;
    late String price = widget.price ?? '0';
    late String finalPrice = widget.finalPrice ?? '0';
    double finalPriceInNum = double.parse(finalPrice);
    double priceInNum = double.parse(price);
    double discountedPrice = double.parse(price) - double.parse(finalPrice);
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height + 20),
        child: Column(
          children: [
            const SizedBox(
              height: 90,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                elevation: 1,
                child: Center(child: Text('Address')),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              child: Column(
                children: [
                  ListTile(
                    leading: SizedBox(
                      child: Image.asset(
                        widget.image ?? '',
                        height: 55,
                        width: 55,
                        fit: BoxFit.contain,
                      ),
                    ),
                    title: Text(
                      widget.title ?? '',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                    subtitle: Text(
                      widget.highlights ?? '',
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Card(
                          shadowColor: Colors.grey,
                          surfaceTintColor: Colors.black,
                          elevation: 8,
                          child: DropdownButton<String>(
                            underline: const Padding(
                              padding: EdgeInsets.zero,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            elevation: 0,
                            isDense: true,
                            style: const TextStyle(color: Colors.black),
                            value: selectedQuantity,
                            onChanged: (String? newValue) {
                              // if (newValue == 'More') {
                              //   _showCustomQuantityDialog(context);
                              // } else {
                              //   setState(() {
                              //     selectedQuantity = newValue!;
                              //   });
                              // }
                              setState(() {
                                selectedQuantity = newValue!;
                              });
                            },
                            items: <String>[
                              '1',
                              '2',
                              '3',
                              'More',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '$discountPrice% off',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  '\u{20B9}${priceInNum.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                '\u{20B9}${finalPriceInNum.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('+\u{20B9}99 Secured Packaging Fee'),
                          ),
                          const Text('3 Offers Applies . 8 Offers Available')
                        ],
                      )
                    ],
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                    child: Row(
                      children: [
                        Text('Delivery by 11 PM, Tomorrow'),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('|'),
                        ),
                        Row(
                          children: [
                            Text(
                              '\u{20B9}70',
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Free Delivery',
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 170,
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      color: Colors.white70,
                      child: Center(child: Text("Offer Card")),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              border: Border(left: BorderSide.none)),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.delete_outline),
                            label: const Text(
                              'Remove',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                iconColor:
                                    MaterialStateProperty.all(Colors.grey),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                              border: Border(left: BorderSide.none)),
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.inventory_2_outlined),
                            label: const Text(
                              'Save for later',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                iconColor:
                                    MaterialStateProperty.all(Colors.grey),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(color: Colors.grey))),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            border: Border(left: BorderSide.none)),
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.wb_twilight_outlined),
                          label: const Text(
                            'Buy this now',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              iconColor: MaterialStateProperty.all(Colors.grey),
                              textStyle: MaterialStateProperty.all(
                                  const TextStyle(color: Colors.grey))),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              child: Card(
                margin: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Price (2 items)'),
                          Text(''
                              '\u{20B9}${priceInNum.toStringAsFixed(2)}')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Discount'),
                          Text(
                            ''
                            '-\u{20B9}${discountedPrice.toStringAsFixed(2)}',
                            style: const TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Charges'),
                          Row(
                            children: [
                              Text(
                                '\u{20B9}70',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text(
                                  'Free Delivery',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Secured Packaging Fee'),
                          Text(
                            '\u{20B9}99',
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Container(
                        height: 55,
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide.none,
                                left: BorderSide.none,
                                top: BorderSide(color: Colors.grey, width: 0.5),
                                bottom: BorderSide(
                                    color: Colors.grey, width: 0.5))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Text('Total Amount'), Text('total')],
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                      child: Text(
                        'You will save 260 on this order',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showCustomQuantityDialog(BuildContext context) async {
    String? newSelectedQuantity = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Quantity'),
          content: TextFormField(
            decoration: const InputDecoration(labelText: 'Quantity'),
            onChanged: (value) {
              setState(() {
                moreQuantity = value;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(selectedQuantity);
              },
            ),
            TextButton(
              child: const Text('Apply'),
              onPressed: () {
                Navigator.of(context).pop(moreQuantity);
              },
            ),
          ],
        );
      },
    );

    if (newSelectedQuantity != null) {
      setState(() {
        selectedQuantity = newSelectedQuantity;
      });
    }
  }
}
