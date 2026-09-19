import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/category_chip.dart';
import '../widgets/home_header.dart';
import '../widgets/map_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/suggested_places.dart';

import 'restaurants_screen.dart';
import 'accommodation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),

                    const SizedBox(height: 25),

                    const SearchBarWidget(),

                    const SizedBox(height: 30),

                    const Text(
                      "Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      height: 42,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // Restaurants
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RestaurantsScreen(),
                                ),
                              );
                            },
                            child: const CategoryChip(
                              title: "Restaurants",
                              icon: Icons.restaurant,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Hotels
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AccommodationScreen(),
                                ),
                              );
                            },
                            child: const CategoryChip(
                              title: "Hotels",
                              icon: Icons.hotel,
                            ),
                          ),

                          const SizedBox(width: 12),

                          // Attractions
                          const CategoryChip(
                            title: "Attractions",
                            icon: Icons.place,
                          ),

                          const SizedBox(width: 12),

                          // Shopping
                          const CategoryChip(
                            title: "Shopping",
                            icon: Icons.shopping_bag,
                          ),

                          const SizedBox(width: 12),

                          // Events
                          const CategoryChip(
                            title: "Events",
                            icon: Icons.event,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "Explore Pretoria",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const MapCard(),

                    const SizedBox(height: 500),
                  ],
                ),
              ),
            ),

            DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.20,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF18181A),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 14),

                      Container(
                        width: 55,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "Suggested Places",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Expanded(
                        child: SuggestedPlaces(
                          scrollController: scrollController,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}