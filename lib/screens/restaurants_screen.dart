import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Restaurants",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          RestaurantCard(
            name: "Kream Restaurant",
            location: "Brooklyn, Pretoria",
            cuisine: "Fine Dining",
          ),
          SizedBox(height: 16),
          RestaurantCard(
            name: "Crawdaddy's",
            location: "Pretoria East",
            cuisine: "Steak & Seafood",
          ),
          SizedBox(height: 16),
          RestaurantCard(
            name: "Summit Grill",
            location: "Menlyn",
            cuisine: "Grill House",
          ),
          SizedBox(height: 16),
          RestaurantCard(
            name: "Geet Indian Restaurant",
            location: "Pretoria",
            cuisine: "Indian",
          ),
        ],
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  final String name;
  final String location;
  final String cuisine;

  const RestaurantCard({
    super.key,
    required this.name,
    required this.location,
    required this.cuisine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.accent,
              child: Icon(
                Icons.restaurant,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    location,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    cuisine,
                    style: const TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}