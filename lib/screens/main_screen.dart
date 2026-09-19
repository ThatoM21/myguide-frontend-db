import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';

import 'home_screen.dart';
import 'explore_screen.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

import 'landmarks_screen.dart';
import 'accommodation_screen.dart';
import 'bucket_list_screen.dart';
import 'itinerary_screen.dart';
import 'places_visited_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    ExploreScreen(),
    FavoritesScreen(),
  ];

  void changePage(int index) {
    if (index == 3) {
      _showMenu();
      return;
    }

    setState(() {
      currentIndex = index;
    });
  }

  void _showMenu() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          padding: const EdgeInsets.fromLTRB(
            24,
            20,
            24,
            30,
          ),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: 55,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.accent,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mpho Maleka",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Explore Pretoria with MyGuide",
                              style: TextStyle(
                                color: Colors.white60,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: ListView(
                    children: [
                      // Profile
                      _menuTile(
                        Icons.person,
                        "Profile",
                      ),

                      // Landmarks
                      _menuTile(
                        Icons.account_balance,
                        "Landmarks",
                      ),

                      // Accommodation
                      _menuTile(
                        Icons.hotel,
                        "Accommodation",
                      ),

                      // Bucket List
                      _menuTile(
                        Icons.star_outline,
                        "Bucket List",
                      ),

                      // Itinerary
                      _menuTile(
                        Icons.route,
                        "Itinerary",
                      ),

                      // Places Visited
                      _menuTile(
                        Icons.location_history,
                        "Places I've Visited",
                      ),

                      const Divider(
                        color: Colors.white12,
                      ),

                      // Settings
                      _menuTile(
                        Icons.settings,
                        "Settings",
                      ),

                      // About
                      _menuTile(
                        Icons.info_outline,
                        "About",
                      ),

                      // Theme
                      _menuTile(
                        Icons.dark_mode,
                        "Theme",
                      ),

                      // Logout
                      _menuTile(
                        Icons.logout,
                        "Logout",
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _menuTile(
    IconData icon,
    String title, {
    Color color = Colors.white,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          leading: Icon(
            icon,
            color: color,
          ),

          title: Text(
            title,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),

          trailing: const Icon(
            Icons.chevron_right,
            color: Colors.white38,
          ),

          onTap: () {
            Navigator.pop(context);

            Future.delayed(
              const Duration(milliseconds: 200),
              () {
                switch (title) {
                  case "Profile":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfileScreen(),
                      ),
                    );
                    break;

                  case "Landmarks":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LandmarksScreen(),
                      ),
                    );
                    break;

                  case "Accommodation":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AccommodationScreen(),
                      ),
                    );
                    break;

                  case "Bucket List":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BucketListScreen(),
                      ),
                    );
                    break;

                  case "Itinerary":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ItineraryScreen(),
                      ),
                    );
                    break;

                  case "Places I've Visited":
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PlacesVisitedScreen(),
                      ),
                    );
                    break;

                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "$title coming soon",
                        ),
                      ),
                    );
                }
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: screens[currentIndex],

      bottomNavigationBar: SafeArea(
        top: false,
        child: CustomBottomNav(
          selectedIndex: currentIndex,
          onItemTapped: changePage,
        ),
      ),
    );
  }
}