import 'package:shared_preferences/shared_preferences.dart';

class CartManager {
  late SharedPreferences _prefs;
  final List<int> _cartItems = [];

  CartManager() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    await loadCartItems();
  }

  List<int> get cartItems => _cartItems;

  Future<void> loadCartItems() async {
    final cartItemsAsString = _prefs.getStringList('cartItems');
    if (cartItemsAsString != null) {
      _cartItems.clear();
      for (final item in cartItemsAsString) {
        _cartItems.add(int.parse(item));
      }
    }
  }

  Future<void> addToCart(int productId) async {
    _cartItems.add(productId);
    final cartItemsAsString = _cartItems.map((id) => id.toString()).toList();
    await _prefs.setStringList('cartItems', cartItemsAsString);
  }

  Future<void> removeFromCart(int productId) async {
    _cartItems.remove(productId);
    final cartItemsAsString = _cartItems.map((id) => id.toString()).toList();
    await _prefs.setStringList('cartItems', cartItemsAsString);
  }

  Future<void> clearCart() async {
    _cartItems.clear();
    await _prefs.remove('cartItems');
  }
}
