import 'package:big_bites_admin_panel/screens/coffee_bar.dart';
import 'package:big_bites_admin_panel/screens/pizza_spice.dart';
import 'package:big_bites_admin_panel/screens/super_burger.dart';

import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex;

  const BottomNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int currentindex;

  @override
  void initState() {
    super.initState();
    currentindex = widget.initialIndex;
  }

  final screen = [const SuperBurger(), const CoffeeBar(), const PizzaSpice()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: screen,
        index: currentindex,
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20)
            ]),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromARGB(255, 11, 37, 11),
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          currentIndex: currentindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "SuperBurger"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "CoffeeBar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "PizzaSpice"),
          ],
        ),
      ),
    );
  }
}
