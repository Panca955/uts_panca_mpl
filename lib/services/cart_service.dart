// lib/services/cart_service.dart
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(Product product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].incrementQuantity();
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners(); // Notify listeners that the cart has changed
  }

  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].incrementQuantity();
      notifyListeners();
    }
  }

  void decreaseQuantity(Product product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (_items[index].quantity > 1) {
        _items[index].decrementQuantity();
      } else {
        _items.removeAt(index); // Remove item if quantity becomes 0
      }
      notifyListeners();
    }
  }

  double getTotalPrice() {
    return _items.fold(
      0.0,
      (total, current) => total + (current.product.price * current.quantity),
    );
  }

  int getTotalItems() {
    return _items.fold(0, (total, current) => total + current.quantity);
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
