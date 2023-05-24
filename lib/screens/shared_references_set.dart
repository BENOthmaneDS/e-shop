import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesSet extends StatefulWidget {
  const SharedPreferencesSet({super.key});

  @override
  State<SharedPreferencesSet> createState() => _SharedPreferencesSetState();
}

class _SharedPreferencesSetState extends State<SharedPreferencesSet> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Future<void> setOrderedItems(itemsId) async {
    final SharedPreferences perf = await SharedPreferences.getInstance();
    perf.setInt('ItemID', itemsId);
  }
}