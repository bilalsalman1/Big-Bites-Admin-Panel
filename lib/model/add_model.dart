import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String title;

  String description;
  String imageUrl;
  double price;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titles': title, // Change this line to match the get code
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      // Also ensure this matches with your get code
    };
  }
}

class AddModel extends StatefulWidget {
  // final VoidCallback onAddProduct;
  final String collections;
  final String appBar;
  AddModel({
    // required this.onAddProduct,
    required this.collections,
    required this.appBar,
  });

  @override
  _AddModelState createState() => _AddModelState();
}

class _AddModelState extends State<AddModel> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  Future<void> addProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection(widget.collections)
        .doc(product.id)
        .set(product.toMap());
  }

  Future<void> _addProduct() async {
    if (_imageUrlController.text.isNotEmpty &&
        _titleController.text.isNotEmpty &&
        _priceController.text.isNotEmpty) {
      Product newProduct = Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        price: double.parse(_priceController.text),
      );

      print(newProduct.toMap());

      await addProduct(newProduct);

      _titleController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _imageUrlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.appBar),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: _addProduct,
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
