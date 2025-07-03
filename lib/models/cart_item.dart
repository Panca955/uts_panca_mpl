// lib/models/cart_item.dart
import 'package:uts_panca_mpl/models/product.dart'; // Make sure the path is correct

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  // Method to update quantity
  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
