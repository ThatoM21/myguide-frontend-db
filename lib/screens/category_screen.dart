import 'package:flutter/material.dart';

import '../data/places.dart';
import '../theme/app_colors.dart';
import 'place_details_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final categoryPlaces = places.where((place) {
      return place["category"] == category;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: Text(category),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categoryPlaces.length,
        itemBuilder: (context, index) {
          final place = categoryPlaces[index];

          return Card(
            color: AppColors.card,
            margin: const EdgeInsets.only(bottom: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceDetailsScreen(
                      title: place["title"],
                      location: place["location"],
                      imageUrl: place["image"],
                      rating: place["rating"],
                      category: place["category"],
                      distance: place["distance"],
                      description: place["description"],
                      moreInfo: place["moreInfo"],
                      openingHours: place["hours"],
                      latitude: place["lat"],
                      longitude: place["lng"],
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(18),
                    ),
                    child: Image.asset(
                      place["image"],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) {
                        return Container(
                          height: 180,
                          color: Colors.grey.shade700,
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Text(
                          place["title"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [

                            const Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 18,
                            ),

                            const SizedBox(width: 6),

                            Expanded(
                              child: Text(
                                place["location"],
                                style: const TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Text(
                          place["description"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}