class UserProfile {
  final String id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final List<Landmark> landmarks;
  final List<Accommodation> accommodations;
  final List<VisitedPlace> visitedPlaces;
  final List<ItineraryDay> itinerary;
  final List<BucketItem> bucketList;

  UserProfile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.landmarks,
    required this.accommodations,
    required this.visitedPlaces,
    required this.itinerary,
    required this.bucketList,
  });
}

class Landmark {
  final String name;
  final String address;
  final String city;
  final String description;
  final String bookingUrl;
  final String image;

  Landmark({
    required this.name,
    required this.address,
    required this.city,
    required this.description,
    required this.bookingUrl,
    required this.image,
  });
}

class Accommodation {
  final String name;
  final String address;
  final String city;
  final String country;
  final String bookingUrl;
  final String image;

  Accommodation({
    required this.name,
    required this.address,
    required this.city,
    required this.country,
    required this.bookingUrl,
    required this.image,
  });
}

class VisitedPlace {
  final String place;
  final String date;
  final String time;
  final String notes;

  VisitedPlace({
    required this.place,
    required this.date,
    required this.time,
    required this.notes,
  });
}

class ItineraryDay {
  final String day;
  final String date;
  final String time;
  final String place;
  final String activity;

  ItineraryDay({
    required this.day,
    required this.date,
    required this.time,
    required this.place,
    required this.activity,
  });
}

class BucketItem {
  final String place;
  final String date;
  final String notes;

  BucketItem({
    required this.place,
    required this.date,
    required this.notes,
  });
}