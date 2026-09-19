import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../data/places.dart';
import 'place_details_screen.dart';

class FullMapScreen extends StatefulWidget {
  const FullMapScreen({super.key});

  @override
  State<FullMapScreen> createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  final MapController _mapController = MapController();

  final LatLng pretoria = const LatLng(
    -25.7479,
    28.2293,
  );

  Map<String, dynamic>? selectedPlace;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          FlutterMap(
            mapController: _mapController,

            options: MapOptions(
              initialCenter: pretoria,
              initialZoom: 13,
            ),

            children: [

              TileLayer(
                urlTemplate:
                    'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName:
                    'com.example.myguide',
              ),

              MarkerLayer(
                markers: [

                  Marker(
                    point: pretoria,
                    width: 70,
                    height: 70,
                    child: const Icon(
                      Icons.my_location,
                      color: Colors.blue,
                      size: 34,
                    ),
                  ),

                  ...places.map((place) {
                    return Marker(
                      point: LatLng(
                        place["lat"],
                        place["lng"],
                      ),

                      width: 55,
                      height: 55,

                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPlace = place;
                          });
                        },

                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 45,
                        ),
                      ),
                    );
                  }),

                ],
              ),

            ],
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 15,
            left: 20,
            right: 20,

            child: Row(
              children: [

                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: Container(
                    height: 50,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: const Row(
                      children: [

                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Search Pretoria",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
                    if (selectedPlace != null)
            Positioned(
              left: 20,
              right: 20,
              bottom: 120,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Builder(
                  builder: (context) {
                    final place = selectedPlace!;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                place["title"],
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedPlace = null;
                                });
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(place["rating"]),
                            const SizedBox(width: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                place["category"],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(place["location"]),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
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
                            child: const Text("View Details"),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

          Positioned(
            right: 20,
            bottom: 30,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                _mapController.move(
                  pretoria,
                  13,
                );
              },
              child: const Icon(
                Icons.my_location,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}