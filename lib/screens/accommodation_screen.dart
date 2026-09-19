import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/hotel_data.dart';
import '../models/hotels.dart';
import '../theme/app_colors.dart';

class AccommodationScreen extends StatelessWidget {
  const AccommodationScreen({super.key});

  Future<void> _openWebsite(
    BuildContext context,
    String website,
  ) async {
    final Uri url = Uri.parse(website);

    try {
      final success = await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );

      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Unable to open website"),
          ),
        );
      }
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Unable to open website"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Accommodation",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          final Hotel hotel = hotels[index];

          return Card(
            color: AppColors.card,
            margin: const EdgeInsets.only(bottom: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    hotel.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey.shade800,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.broken_image,
                                  size: 60,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Image not found",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  hotel.image,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
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
                        hotel.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              hotel.address,
                              style: const TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _openWebsite(
                              context,
                              hotel.website,
                            );
                          },
                          icon: const Icon(Icons.public),
                          label: const Text("Visit Website"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.accent,
                            foregroundColor:
                                Colors.white,
                            minimumSize:
                                const Size.fromHeight(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}