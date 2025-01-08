import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      home: const ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    );
  }
}

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add left and right padding
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        child: ListTile(
          onTap: () {
            onCartChanged(product, inCart);
          },
          leading: CircleAvatar(
            backgroundColor: _getColor(context),
            child: Text(product.name[0]),
          ),
          title: Text(
            product.name,
            style: _getTextStyle(context),
          ),
        ),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.remove(product);
      } else {
        _shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}