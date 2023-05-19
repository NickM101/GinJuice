import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
          ),
          const Spacer(),
          const Center(
            child: Text('Search anything'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
