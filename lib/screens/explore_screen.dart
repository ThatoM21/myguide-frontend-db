import 'package:flutter/material.dart';

import '../data/places.dart';
import '../data/itinerary_data.dart';
import '../theme/app_colors.dart';

import 'place_details_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Attraction',
    'Hotel',
    'Restaurant',
    'Shopping',
    'Event',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPlaces = selectedCategory == 'All'
        ? places
        : places
            .where(
              (place) => place['category'] == selectedCategory,
            )
            .toList();

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Explore',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          // CATEGORY BUTTONS
          SizedBox(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];

                final bool selected =
                    selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: selected,

                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },

                    selectedColor: AppColors.accent,
                    backgroundColor: AppColors.card,

                    labelStyle: TextStyle(
                      color: selected
                          ? Colors.white
                          : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // PLACES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: filteredPlaces.length,

              itemBuilder: (context, index) {
                final place = filteredPlaces[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 20),

                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  clipBehavior: Clip.antiAlias,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      // IMAGE
                      Image.asset(
                        place['image'],
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,

                        errorBuilder:
                            (context, error, stackTrace) {
                          return Container(
                            height: 190,
                            color: Colors.grey.shade800,

                            child: const Center(
                              child: Icon(
                                Icons.image,
                                color: Colors.white54,
                                size: 55,
                              ),
                            ),
                          );
                        },
                      ),

                      // INFORMATION
                      Padding(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            // TITLE + RATING
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    place['title'],

                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight:
                                          FontWeight.bold,
                                    ),
                                  ),
                                ),

                                const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 18,
                                ),

                                const SizedBox(width: 4),

                                Text(
                                  place['rating'],

                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // LOCATION
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColors.accent,
                                  size: 18,
                                ),

                                const SizedBox(width: 5),

                                Expanded(
                                  child: Text(
                                    place['location'],

                                    style: const TextStyle(
                                      color: Colors.white60,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // DESCRIPTION
                            Text(
                              place['description'],

                              maxLines: 2,

                              overflow:
                                  TextOverflow.ellipsis,

                              style: const TextStyle(
                                color: Colors.white60,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // BUTTONS
                            Row(
                              children: [
                                Expanded(
                                  child:
                                      ElevatedButton.icon(
                                    onPressed: () {
                                      final String placeName =
                                          place['title'];

                                      ItineraryData.addPlace(
                                        placeName,
                                      );

                                      setState(() {});

                                      ScaffoldMessenger
                                              .of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            '$placeName added to your itinerary.',
                                          ),
                                          duration:
                                              const Duration(
                                            seconds: 2,
                                          ),
                                        ),
                                      );
                                    },

                                    icon: const Icon(
                                      Icons.add,
                                      size: 18,
                                    ),

                                    label: const Text(
                                      'Add to Itinerary',
                                    ),

                                    style:
                                        ElevatedButton
                                            .styleFrom(
                                      backgroundColor:
                                          AppColors.accent,
                                      foregroundColor:
                                          Colors.white,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                // VIEW DETAILS
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,

                                      MaterialPageRoute(
                                        builder: (_) =>
                                            PlaceDetailsScreen(
                                          title:
                                              place['title'],
                                          location:
                                              place['location'],
                                          imageUrl:
                                              place['image'],
                                          rating:
                                              place['rating'],
                                          category:
                                              place['category'],
                                          distance:
                                              place['distance'],
                                          description:
                                              place[
                                                  'description'],
                                          moreInfo:
                                              place['moreInfo'],
                                          openingHours:
                                              place['hours'],
                                          latitude:
                                              place['lat'],
                                          longitude:
                                              place['lng'],
                                        ),
                                      ),
                                    );
                                  },

                                  icon: const Icon(
                                    Icons
                                        .arrow_forward_ios,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}