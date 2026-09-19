import 'package:flutter/material.dart';

import '../data/places.dart';
import 'place_card.dart';

class SuggestedPlaces extends StatelessWidget {
  final ScrollController scrollController;

  const SuggestedPlaces({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      itemCount: places.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        final place = places[index];

       return PlaceCard(
  title: place["title"]?.toString() ?? "No title",
  location: place["location"]?.toString() ?? "No location",
  imageUrl: place["image"]?.toString() ?? "",
  rating: place["rating"]?.toString() ?? "0",
  category: place["category"]?.toString() ?? "Unknown",
  distance: place["distance"]?.toString() ?? "",
  description: place["description"]?.toString() ?? "",
  moreInfo: place["moreInfo"]?.toString() ?? "No information available.",
  openingHours: place["hours"]?.toString() ?? "",
  latitude: (place["lat"] as num?)?.toDouble() ?? 0.0,
  longitude: (place["lng"] as num?)?.toDouble() ?? 0.0,
);
      },
    );
  }
}