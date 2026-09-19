import 'package:flutter/material.dart';

import '../data/itinerary_data.dart';
import '../theme/app_colors.dart';

class ItineraryScreen extends StatefulWidget {
  const ItineraryScreen({super.key});

  @override
  State<ItineraryScreen> createState() =>
      _ItineraryScreenState();
}

class _ItineraryScreenState extends State<ItineraryScreen> {
  // ----------------------------------------------------------
  // ADD DAY DIALOG
  // ----------------------------------------------------------

  void _showAddDayDialog() {
    final TextEditingController nameController =
        TextEditingController();

    final TextEditingController dateController =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.card,

          title: const Text(
            'Add New Day',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  labelText: 'Day name',
                  hintText: 'Example: Day 4',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.white38,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: dateController,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText:
                      'Example: Shopping & Food',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ),
                  hintStyle: const TextStyle(
                    color: Colors.white38,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                final String name =
                    nameController.text.trim();

                final String date =
                    dateController.text.trim();

                if (name.isEmpty) {
                  return;
                }

                setState(() {
                  ItineraryData.addDay(
                    name,
                    date.isEmpty
                        ? 'New Day'
                        : date,
                  );
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'New day added.',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.accent,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Add Day',
              ),
            ),
          ],
        );
      },
    );
  }

  // ----------------------------------------------------------
  // EDIT DAY DIALOG
  // ----------------------------------------------------------

  void _showEditDayDialog(int dayIndex) {
    final day = ItineraryData.days[dayIndex];

    final TextEditingController nameController =
        TextEditingController(
      text: day['day'],
    );

    final TextEditingController dateController =
        TextEditingController(
      text: day['date'],
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.card,

          title: const Text(
            'Edit Day',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  labelText: 'Day name',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: dateController,

                style: const TextStyle(
                  color: Colors.white,
                ),

                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: const TextStyle(
                    color: Colors.white70,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white24,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.accent,
                    ),
                  ),
                ),
              ),
            ],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                final String name =
                    nameController.text.trim();

                final String date =
                    dateController.text.trim();

                if (name.isEmpty) {
                  return;
                }

                setState(() {
                  ItineraryData.renameDay(
                    dayIndex,
                    name,
                    date,
                  );
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Day updated.',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    AppColors.accent,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Save',
              ),
            ),
          ],
        );
      },
    );
  }

  // ----------------------------------------------------------
  // DELETE DAY
  // ----------------------------------------------------------

  void _deleteDay(int dayIndex) {
    if (ItineraryData.days.length <= 1) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        const SnackBar(
          content: Text(
            'You must keep at least one day.',
          ),
        ),
      );

      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.card,

          title: const Text(
            'Delete Day?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          content: const Text(
            'Are you sure you want to delete this entire day and all the places inside it?',
            style: TextStyle(
              color: Colors.white70,
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  ItineraryData.deleteDay(
                    dayIndex,
                  );
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Day deleted.',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),

              child: const Text(
                'Delete',
              ),
            ),
          ],
        );
      },
    );
  }

  // ----------------------------------------------------------
  // DELETE PLACE
  // ----------------------------------------------------------

  void _deletePlace(
    int dayIndex,
    int placeIndex,
  ) {
    setState(() {
      ItineraryData.removePlace(
        dayIndex,
        placeIndex,
      );
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(
      const SnackBar(
        content: Text(
          'Place removed from itinerary.',
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // BUILD
  // ----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final days = ItineraryData.days;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text(
          'My Itinerary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: AppColors.background,

        foregroundColor: Colors.white,

        elevation: 0,

        actions: [
          IconButton(
            onPressed: _showAddDayDialog,

            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),

            tooltip: 'Add Day',
          ),
        ],
      ),

      body: days.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [
                  const Icon(
                    Icons.route,
                    size: 70,
                    color: AppColors.accent,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Your Itinerary is Empty',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Add a day to start planning.',
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton.icon(
                    onPressed: _showAddDayDialog,

                    icon: const Icon(
                      Icons.add,
                    ),

                    label: const Text(
                      'Add Day',
                    ),

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.accent,
                      foregroundColor:
                          Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(20),

              itemCount: days.length,

              itemBuilder:
                  (context, dayIndex) {
                final day =
                    days[dayIndex];

                final String dayName =
                    day['day'];

                final String date =
                    day['date'];

                final List places =
                    day['places'];

                return Container(
                  margin:
                      const EdgeInsets.only(
                    bottom: 18,
                  ),

                  padding:
                      const EdgeInsets.all(18),

                  decoration:
                      BoxDecoration(
                    color: AppColors.card,

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [
                      // DAY HEADER
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 22,

                            backgroundColor:
                                AppColors.accent,

                            child: Text(
                              '${dayIndex + 1}',

                              style:
                                  const TextStyle(
                                color:
                                    Colors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(
                            width: 12,
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [
                                Text(
                                  dayName,

                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white,
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),

                                const SizedBox(
                                  height: 3,
                                ),

                                Text(
                                  date,

                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white60,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // EDIT DAY
                          IconButton(
                            onPressed: () {
                              _showEditDayDialog(
                                dayIndex,
                              );
                            },

                            icon:
                                const Icon(
                              Icons.edit_outlined,
                              color: Colors.white70,
                            ),

                            tooltip: 'Edit Day',
                          ),

                          // DELETE DAY
                          IconButton(
                            onPressed: () {
                              _deleteDay(
                                dayIndex,
                              );
                            },

                            icon:
                                const Icon(
                              Icons.delete_outline,
                              color:
                                  Colors.redAccent,
                            ),

                            tooltip:
                                'Delete Day',
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      const Divider(
                        color: Colors.white12,
                      ),

                      const SizedBox(
                        height: 5,
                      ),

                      // EMPTY DAY
                      if (places.isEmpty)
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(
                            vertical: 12,
                          ),

                          child: Text(
                            'No places added yet.',

                            style:
                                TextStyle(
                              color:
                                  Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ),

                      // PLACES
                      ...List.generate(
                        places.length,

                        (placeIndex) {
                          final String place =
                              places[placeIndex];

                          return Padding(
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 8,
                            ),

                            child: Row(
                              children: [
                                const Icon(
                                  Icons
                                      .location_on,
                                  color:
                                      AppColors
                                          .accent,
                                  size: 20,
                                ),

                                const SizedBox(
                                  width: 10,
                                ),

                                Expanded(
                                  child: Text(
                                    place,

                                    style:
                                        const TextStyle(
                                      color:
                                          Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),

                                IconButton(
                                  onPressed: () {
                                    _deletePlace(
                                      dayIndex,
                                      placeIndex,
                                    );
                                  },

                                  icon:
                                      const Icon(
                                    Icons
                                        .delete_outline,
                                    color: Colors
                                        .redAccent,
                                    size: 22,
                                  ),

                                  tooltip:
                                      'Remove Place',
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // ADD PLACE BUTTON
                      SizedBox(
                        width: double.infinity,

                        child:
                            OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger
                                .of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Go to Explore to add places to your itinerary.',
                                ),
                              ),
                            );
                          },

                          icon: const Icon(
                            Icons.add_location_alt,
                          ),

                          label: const Text(
                            'Add Places from Explore',
                          ),

                          style:
                              OutlinedButton
                                  .styleFrom(
                            foregroundColor:
                                AppColors
                                    .accent,

                            side:
                                const BorderSide(
                              color:
                                  AppColors
                                      .accent,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

      // ADD DAY BUTTON
      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: _showAddDayDialog,

        backgroundColor:
            AppColors.accent,

        foregroundColor:
            Colors.white,

        icon: const Icon(
          Icons.add,
        ),

        label: const Text(
          'Add Day',
        ),
      ),
    );
  }
}