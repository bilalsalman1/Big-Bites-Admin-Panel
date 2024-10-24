import 'package:big_bites_admin_panel/model/add_model.dart';
import 'package:flutter/material.dart';

class CoffeeBar extends StatefulWidget {
  const CoffeeBar({super.key});

  @override
  State<CoffeeBar> createState() => _CoffeeBarState();
}

class _CoffeeBarState extends State<CoffeeBar> {
  @override
  Widget build(BuildContext context) {
    return AddModel(collections: 'CoffeeBar', appBar: 'CoffeeBar');
  }
}
