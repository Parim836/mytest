import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductScreen extends StatefulWidget {
  final Map? product;

  AddProductScreen({this.product});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.product != null) {
      nameController.text = widget.product!['name'];
      descriptionController.text = widget.product!['description'];
      priceController.text = widget.product!['price'].toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }

  Future<void> createOrUpdateProduct() async {
    try {
      var response;

      if (widget.product == null) {
        response = await http.post(
          Uri.parse("http://localhost:3000/products"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": nameController.text.trim(),
            "description": descriptionController.text.trim(),
            "price": double.tryParse(priceController.text) ?? 0.0,
          }),
        );
      } else {
        response = await http.put(
          Uri.parse("http://localhost:3000/products/${widget.product!['id']}"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": nameController.text.trim(),
            "description": descriptionController.text.trim(),
            "price": double.tryParse(priceController.text) ?? 0.0,
          }),
        );
      }

      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(widget.product == null
                ? "Product added successfully!"
                : "Product updated successfully!"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pop(context, true);
      } else {
        throw Exception("Failed to save product");
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred! Please try again."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.product == null ? "Add Product" : "Edit Product")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createOrUpdateProduct,
              child: Text(
                  widget.product == null ? "Add Product" : "Update Product"),
            ),
          ],
        ),
      ),
    );
  }
}
