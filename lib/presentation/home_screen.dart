import 'package:flutter/material.dart';
import 'package:velocitybloom/presentation/account/account_screen.dart';
import 'package:velocitybloom/presentation/add_to_cart_screen.dart';
import 'package:velocitybloom/presentation/application_product_const.dart';
import 'package:velocitybloom/presentation/categories_screen.dart';
import 'package:velocitybloom/presentation/main_listing_screen.dart';
import 'package:velocitybloom/presentation/product_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ListingScreenProductMenuModal> productModalData =
      ListingScreenProductMenuModalConst.listOfProductInListingScreen;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return _getHomeScreen();
      case 1:
        return _getCategoryScreen();
      case 2:
        return _getAccountScreen();
      case 3:
        return _getCartScreen();
      default:
        return Container();
    }
  }

  Widget _getHomeScreen() {
    return const ProductListingScreen();
  }

  Widget _getCategoryScreen() {
    return const CategoriesScreen();
  }

  Widget _getAccountScreen() {
    return const AccountScreen();
  }

  Widget _getCartScreen() {
    return AddToCartScreen();
  }

  Widget _getBottomNavigationBar() {
    return Container(
        height: 60,
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.deepOrange,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            currentIndex: _selectedIndex,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
            ],
          ),
        ));
  }
}
