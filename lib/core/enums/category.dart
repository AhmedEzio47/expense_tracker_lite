import 'package:flutter/material.dart';

enum Category {
  groceries(
    id: 1,
    name: 'Groceries',
    icon: Icons.shopping_cart_outlined,
    color: Colors.blue,
  ),
  entertainment(
    id: 2,
    name: 'Entertainment',
    icon: Icons.movie_creation_outlined,
    color: Colors.orangeAccent,
  ),
  gas(
    id: 3,
    name: 'Gas',
    icon: Icons.local_gas_station_outlined,
    color: Colors.red,
  ),
  shopping(
    id: 4,
    name: 'Shopping',
    icon: Icons.shopping_bag_outlined,
    color: Colors.orange,
  ),
  newspaper(
    id: 5,
    name: 'Newspaper',
    icon: Icons.newspaper_outlined,
    color: Colors.orange,
  ),
  transport(
    id: 6,
    name: 'Transport',
    icon: Icons.directions_car_outlined,
    color: Colors.blue,
  ),
  rent(id: 7, name: 'Rent', icon: Icons.home_outlined, color: Colors.orange);

  final int id;
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
