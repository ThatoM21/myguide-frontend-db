import 'package:flutter/material.dart';

class PlacesVisitedScreen extends StatelessWidget {
  const PlacesVisitedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Places I've Visited"),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          "Your visited places will appear here",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}