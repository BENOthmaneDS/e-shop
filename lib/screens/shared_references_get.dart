import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesGet extends StatefulWidget {
  const SharedPreferencesGet({super.key});

  @override
  State<SharedPreferencesGet> createState() => _SharedPreferencesGetState();
}

class _SharedPreferencesGetState extends State<SharedPreferencesGet> {
  int? itemValue;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  void getOrderedItems() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    itemValue = pref.getInt('ItemID');
    // Here I made you an example for a single item, you may need to use an array to set and another array for get because
    // We work with many orders at once
  }
}