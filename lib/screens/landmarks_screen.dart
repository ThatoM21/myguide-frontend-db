import 'package:flutter/material.dart';

import '../data/places.dart';
import 'place_details_screen.dart';


class LandmarksScreen extends StatelessWidget {

  const LandmarksScreen({super.key});


  @override
  Widget build(BuildContext context) {


    final landmarks = places
        .where((place) => place["category"] == "Attraction")
        .toList();



    return Scaffold(

      backgroundColor: const Color(0xFF18181A),



      appBar: AppBar(

        backgroundColor: const Color(0xFF18181A),

        elevation: 0,

        centerTitle: true,


        title: const Text(

          "Landmarks",

          style: TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),


        iconTheme: const IconThemeData(

          color: Colors.white,

        ),

      ),




      body: ListView.builder(


        padding: const EdgeInsets.all(20),


        itemCount: landmarks.length,



        itemBuilder: (context, index) {



          final place = landmarks[index];



          return GestureDetector(


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



            child: Container(


              margin: const EdgeInsets.only(bottom: 22),


              decoration: BoxDecoration(


                color: const Color(0xFF2A2A2D),


                borderRadius:
                    BorderRadius.circular(22),


              ),


              clipBehavior: Clip.antiAlias,



              child: Column(


                crossAxisAlignment:
                    CrossAxisAlignment.start,



                children: [



                  Image.asset(

                    place["image"],

                    height: 210,

                    width: double.infinity,

                    fit: BoxFit.cover,



                    errorBuilder:
                        (context, error, stackTrace) {


                      return Container(


                        height: 210,


                        color: Colors.grey.shade800,



                        child: const Center(

                          child: Icon(

                            Icons.image,

                            color: Colors.white54,

                            size: 60,

                          ),

                        ),

                      );


                    },


                  ),




                  Padding(


                    padding:
                        const EdgeInsets.all(18),



                    child: Column(


                      crossAxisAlignment:
                          CrossAxisAlignment.start,



                      children: [



                        Row(



                          children: [



                            Expanded(



                              child: Text(



                                place["title"],



                                style: const TextStyle(



                                  color: Colors.white,



                                  fontSize: 22,



                                  fontWeight:
                                      FontWeight.bold,



                                ),



                              ),



                            ),




                            Container(



                              padding:
                                  const EdgeInsets.symmetric(

                                horizontal: 10,

                                vertical: 6,

                              ),



                              decoration: BoxDecoration(



                                color: Colors.orange,



                                borderRadius:
                                    BorderRadius.circular(18),



                              ),



                              child: Row(



                                children: [



                                  const Icon(



                                    Icons.star,



                                    color: Colors.white,



                                    size: 16,



                                  ),



                                  const SizedBox(width: 4),



                                  Text(



                                    place["rating"],



                                    style:
                                        const TextStyle(



                                      color: Colors.white,



                                      fontWeight:
                                          FontWeight.bold,



                                    ),



                                  ),



                                ],



                              ),



                            ),



                          ],



                        ),




                        const SizedBox(height: 12),




                        Row(



                          children: [



                            const Icon(



                              Icons.location_on,



                              color: Colors.redAccent,



                            ),



                            const SizedBox(width: 6),




                            Expanded(



                              child: Text(



                                place["location"],



                                style:
                                    const TextStyle(



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



                          overflow:
                              TextOverflow.ellipsis,



                          style:
                              const TextStyle(



                            color: Colors.white60,



                            height: 1.5,



                          ),



                        ),




                        const SizedBox(height: 18),




                        Row(



                          children: [



                            Container(



                              padding:
                                  const EdgeInsets.symmetric(



                                horizontal: 12,



                                vertical: 6,



                              ),



                              decoration: BoxDecoration(



                                color: Colors.deepPurple,



                                borderRadius:
                                    BorderRadius.circular(20),



                              ),



                              child: Text(



                                place["category"],



                                style:
                                    const TextStyle(



                                  color: Colors.white,



                                  fontWeight:
                                      FontWeight.bold,



                                ),



                              ),



                            ),




                            const Spacer(),




                            ElevatedButton.icon(



                              onPressed: () {



                                Navigator.push(



                                  context,



                                  MaterialPageRoute(



                                    builder: (_) =>
                                        PlaceDetailsScreen(



                                      title: place["title"],



                                      location:
                                          place["location"],



                                      imageUrl:
                                          place["image"],



                                      rating:
                                          place["rating"],



                                      category:
                                          place["category"],



                                      distance:
                                          place["distance"],



                                      description:
                                          place["description"],



                                      moreInfo:
                                          place["moreInfo"],



                                      openingHours:
                                          place["hours"],



                                      latitude:
                                          place["lat"],



                                      longitude:
                                          place["lng"],



                                    ),



                                  ),



                                );


                              },



                              icon: const Icon(



                                Icons.arrow_forward,



                                size: 18,



                              ),



                              label:
                                  const Text("View"),



                              style:
                                  ElevatedButton.styleFrom(



                                backgroundColor:
                                    Colors.deepPurple,



                                foregroundColor:
                                    Colors.white,



                              ),



                            ),



                          ],



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