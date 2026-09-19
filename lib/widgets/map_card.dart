import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../screens/full_map_screen.dart';


class MapCard extends StatelessWidget {

  const MapCard({super.key});


  @override
  Widget build(BuildContext context) {


    const LatLng pretoria = LatLng(
      -25.7479,
      28.2293,
    );


    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (context) => const FullMapScreen(),

          ),

        );

      },


      child: Container(

        height: 330,

        width: double.infinity,


        clipBehavior: Clip.antiAlias,


        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(25),

        ),



        child: Stack(

          children: [



            FlutterMap(

              options: const MapOptions(

                initialCenter: pretoria,

                initialZoom: 14,


                interactionOptions: InteractionOptions(

                  flags: InteractiveFlag.none,

                ),

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

                      width: 60,

                      height: 60,


                      child: const Icon(

                        Icons.location_on,

                        color: Colors.red,

                        size: 45,

                      ),

                    ),



                  ],

                ),



              ],

            ),





            // Dark overlay

            Container(

              color: Colors.black.withValues(alpha: 0.15),

            ),





            // Open map button

            Positioned(

              bottom: 15,

              right: 15,


              child: Container(

                padding: const EdgeInsets.symmetric(

                  horizontal: 15,

                  vertical: 10,

                ),



                decoration: BoxDecoration(

                  color: Colors.white,

                  borderRadius: BorderRadius.circular(30),


                  boxShadow: [

                    BoxShadow(

                      color: Colors.black.withValues(alpha: 0.15),

                      blurRadius: 6,

                      offset: const Offset(0, 3),

                    ),

                  ],

                ),



                child: const Row(

                  mainAxisSize: MainAxisSize.min,


                  children: [



                    Icon(

                      Icons.map,

                      color: Colors.black,

                      size: 20,

                    ),



                    SizedBox(width: 8),



                    Text(

                      "Open Map",

                      style: TextStyle(

                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                      ),

                    ),


                  ],

                ),

              ),

            ),



          ],

        ),

      ),

    );

  }

}