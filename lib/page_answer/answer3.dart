import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Layout3(),
  ));
}

class Layout3 extends StatelessWidget {
  const Layout3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Layout'),
        backgroundColor: const Color.fromARGB(255, 243, 185, 37),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: const Color.fromARGB(255, 206, 205, 205),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Category: Electronics',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductDetail(
                name: 'Kuromi Spiral Hair Ties',
                price: '210',
                imageUrl:
                    'https://www.sanrio.com/cdn/shop/files/zz-2407834491_KU_--1_800x.jpg?v=1720742509',
              ),
              ProductDetail(
                name: 'Kuromi Blanket',
                price: '1350',
                imageUrl:
                    'https://www.sanrio.com/cdn/shop/files/zz-2405421464_KU_--1_800x.jpg?v=1717091716',
              )
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductDetail(
                name: 'Kuromi Plush Mascot Keychain',
                price: '830',
                imageUrl:
                    'https://www.sanrio.com/cdn/shop/files/zz-2407513989_KU_--1_800x.jpg?v=1721938480',
              ),
              ProductDetail(
                name: 'Kuromi Mini Tote',
                price: '1000',
                imageUrl:
                    'https://www.sanrio.com/cdn/shop/files/zz-2410310719_KU_--1_800x.jpg?v=1730416011',
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  const ProductDetail(
      {super.key,
      required this.name,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
        Text(name),
        Text(
          "$price THB",
          style: TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
