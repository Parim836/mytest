import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'addProduct.dart';
import 'dart:convert';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List products = [];
  final String apiUrl = 'http://localhost:3000/products';

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body);
      });
    } else {
      print("Failed to load products.");
    }
  }

  void deleteProduct(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      setState(() {
        products.removeWhere((product) => product['id'].toString() == id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deleted successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete product: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            elevation: 3,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                product['name'],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['description']),
                  SizedBox(height: 5),
                  Text(
                    "ราคา: \$${product['price']}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddProductScreen(product: product),
                        ),
                      ).then((result) {
                        if (result == true) {
                          fetchProducts();
                        }
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Confirm Delete'),
                          content: Text(
                              'Are you sure you want to delete this item?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                String productId = product['id'].toString();
                                print("Product ID to delete: $productId");
                                deleteProduct(productId);
                                Navigator.pop(context);
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
          if (result == true) {
            fetchProducts();
          }
        },
      ),
    );
  }
}
