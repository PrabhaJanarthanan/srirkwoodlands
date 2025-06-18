import 'package:flutter/material.dart';

class BridalCollectionsMobile extends StatelessWidget {
  const BridalCollectionsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(), // Adds a back arrow
        title: const Text('Bridal Collections'),
       // backgroundColor: Colors.amberAccent, // Optional: customize color
        foregroundColor: Colors.black, // Optional: customize text/icon color
        elevation: 1,
      ),
      body: const Center(
        child: Text(
          'Bridal Collections',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
