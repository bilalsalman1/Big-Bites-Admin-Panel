import 'package:big_bites_admin_panel/model/add_model.dart';
import 'package:flutter/material.dart';

class SuperBurger extends StatefulWidget {
  const SuperBurger({super.key});

  @override
  State<SuperBurger> createState() => _SuperBurgerState();
}

class _SuperBurgerState extends State<SuperBurger> {
  @override
  Widget build(BuildContext context) {
    return AddModel(collections: 'SuperBurger', appBar: 'SuperBurger');
  }
}
