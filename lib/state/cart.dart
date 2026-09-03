import 'package:flutter/foundation.dart';
import '../models/product.dart';

class CartItem {
  final Product product;
  int qty;
  CartItem({required this.product, this.qty = 1});
  int get subtotal => product.price * qty;
}

class Cart extends ChangeNotifier {
  final Map<int, CartItem> _items = {};

  List<CartItem> get items => _items.values.toList();

  int get totalItemCount =>
      _items.values.fold(0, (sum, item) => sum + item.qty);

  int get totalPrice =>
      _items.values.fold(0, (sum, item) => sum + item.subtotal);

  bool get isEmpty => _items.isEmpty;

  void add(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.qty += 1;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
