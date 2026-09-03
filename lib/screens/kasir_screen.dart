import 'package:flutter/material.dart';
import '../data/products.dart';
import '../state/cart.dart';
import '../widgets/product_card.dart';
import '../widgets/cart_bar.dart';

class KasirScreen extends StatefulWidget {
  const KasirScreen({super.key});

  @override
  State<KasirScreen> createState() => _KasirScreenState();
}

class _KasirScreenState extends State<KasirScreen> {
  final Cart cart = Cart();

  @override
  void initState() {
    super.initState();
    cart.addListener(() => setState(() {}));
  }

  void _showReceipt() {
    final total = cart.totalPrice;
    final count = cart.totalItemCount;
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Transaksi Berhasil'),
        content: Text('$count item — Total Rp${total.toString()}'),
        actions: [
          TextButton(
            onPressed: () {
              cart.clear();
              Navigator.of(ctx).pop();
            },
            child: const Text('Transaksi Baru'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF3E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF233047),
        title: const Text('Kasir Toko Anda'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.85,
              ),
              itemCount: sampleProducts.length,
              itemBuilder: (context, i) {
                final product = sampleProducts[i];
                return ProductCard(
                  product: product,
                  onTap: () => cart.add(product),
                );
              },
            ),
          ),
          CartBar(cart: cart, onPay: _showReceipt),
        ],
      ),
    );
  }
}
