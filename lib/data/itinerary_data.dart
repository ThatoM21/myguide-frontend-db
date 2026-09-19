class ItineraryData {
  static final List<Map<String, dynamic>> days = [
    {
      'day': 'Day 1',
      'date': 'Pretoria City',
      'places': [
        'Union Buildings',
        'Church Square',
      ],
    },
    {
      'day': 'Day 2',
      'date': 'Culture & History',
      'places': [
        'Freedom Park',
        'Ditsong National Museum',
      ],
    },
    {
      'day': 'Day 3',
      'date': 'Explore Pretoria',
      'places': [
        'Pretoria National Botanical Garden',
      ],
    },
  ];

  // ----------------------------------------------------------
  // ADD PLACE
  // ----------------------------------------------------------

  static void addPlace(String place) {
    days[0]['places'].add(place);
  }

  // ----------------------------------------------------------
  // REMOVE PLACE
  // ----------------------------------------------------------

  static void removePlace(
    int dayIndex,
    int placeIndex,
  ) {
    if (dayIndex < 0 ||
        dayIndex >= days.length) {
      return;
    }

    final List places =
        days[dayIndex]['places'];

    if (placeIndex < 0 ||
        placeIndex >= places.length) {
      return;
    }

    places.removeAt(placeIndex);
  }

  // ----------------------------------------------------------
  // ADD DAY
  // ----------------------------------------------------------

  static void addDay(
    String name,
    String date,
  ) {
    final int dayNumber =
        days.length + 1;

    days.add({
      'day': name,
      'date': date,
      'places': <String>[],
    });

    // Make sure the day number is used
    // if the user entered a blank name.
    if (name.trim().isEmpty) {
      days.last['day'] =
          'Day $dayNumber';
    }
  }

  // ----------------------------------------------------------
  // RENAME / EDIT DAY
  // ----------------------------------------------------------

  static void renameDay(
    int dayIndex,
    String name,
    String date,
  ) {
    if (dayIndex < 0 ||
        dayIndex >= days.length) {
      return;
    }

    if (name.trim().isEmpty) {
      return;
    }

    days[dayIndex]['day'] =
        name.trim();

    days[dayIndex]['date'] =
        date.trim().isEmpty
            ? 'New Day'
            : date.trim();
  }

  // ----------------------------------------------------------
  // DELETE DAY
  // ----------------------------------------------------------

  static void deleteDay(
    int dayIndex,
  ) {
    if (dayIndex < 0 ||
        dayIndex >= days.length) {
      return;
    }

    // Always keep at least one day.
    if (days.length <= 1) {
      return;
    }

    days.removeAt(dayIndex);
  }
}