import 'package:flutter/material.dart';

class BucketListScreen extends StatelessWidget {
  const BucketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Bucket List"),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          "Your bucket list will appear here",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}