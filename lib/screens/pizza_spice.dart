import 'package:big_bites_admin_panel/model/add_model.dart';
import 'package:flutter/material.dart';

class PizzaSpice extends StatefulWidget {
  const PizzaSpice({super.key});

  @override
  State<PizzaSpice> createState() => _PizzaSpiceState();
}

class _PizzaSpiceState extends State<PizzaSpice> {
  @override
  Widget build(BuildContext context) {
    return AddModel(collections: 'PizzaSpice', appBar: 'PizzaSpice');
  }
}
