import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkhub/screens/booking_screen.dart';
import 'package:parkhub/screens/home_page_screen.dart';
import 'package:parkhub/screens/profile_screen.dart';

class ParkingSpot {
  final String name;
  final String address;
  final String price;
  final String distance;
  final String slots;
  final double rating;
  final String image;
  final DateTime startTime;

  ParkingSpot({
    required this.name,
    required this.address,
    required this.price,
    required this.distance,
    required this.slots,
    required this.rating,
    required this.image,
    required this.startTime,
  });
}

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ParkingSpot> ongoingBookings = [];
  List<ParkingSpot> bookingHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    ongoingBookings = [
      ParkingSpot(
        name: 'IOI City Mall Parking',
        address:
            'Lebuh IRC, IOI Resort City, 62502 Putrajaya, Sepang, Selangor',
        price: 'RM3 (1st hour)',
        distance: '1.2 km',
        slots: '45 slots',
        rating: 4.5,
        image: 'assets/images/ioiparkingP1.jpeg',
        startTime: DateTime.now().subtract(
          const Duration(minutes: 30),
        ), // Example start time
      ),
      ParkingSpot(
        name: 'Alamanda Shopping Centre Parking',
        address:
            'Jalan Alamanda, Presint 1, 62000 Putrajaya, Wilayah Persekutuan',
        price: 'RM2 (1st hour)',
        distance: '10.1 km',
        slots: '28 slots',
        rating: 4.2,
        image: 'assets/images/alamandaparking.png',
        startTime: DateTime.now().subtract(
          const Duration(minutes: 60),
        ), // Example start time
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Booking"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          tabs: const [
            Tab(text: "Ongoing booking"),
            Tab(text: "Booking history"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildBookingList(), _buildBookingHistory()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomepageScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, color: Colors.white),
            label: "Nearby",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Colors.white),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildBookingList() {
    return ongoingBookings.isEmpty
        ? const Center(child: Text("No ongoing bookings"))
        : ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: ongoingBookings.length,
          itemBuilder: (context, index) {
            final spot = ongoingBookings[index];
            return _bookingCard(spot, index);
          },
        );
  }

  Widget _buildBookingHistory() {
    return bookingHistory.isEmpty
        ? const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.history, size: 50, color: Colors.grey),
              SizedBox(height: 10),
              Text(
                "No booking history",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        )
        : ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: bookingHistory.length,
          itemBuilder: (context, index) {
            final spot = bookingHistory[index];
            return _historyCard(spot);
          },
        );
  }

  Widget _bookingCard(ParkingSpot spot, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              spot.image,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spot.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  spot.address,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 5),
                Text(
                  spot.price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed:
                            () => _showCancelDialog(context, spot, index),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Release Spot"),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _showTimerDialog(context, spot),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(
                            33,
                            150,
                            243,
                            1,
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("View Timer"),
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
  }

  Widget _historyCard(ParkingSpot spot) {
    return ListTile(
      leading: Image.asset(
        spot.image,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text(spot.name),
      subtitle: Text("Cancelled"),
    );
  }

  void _showCancelDialog(BuildContext context, ParkingSpot spot, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Release Spot"),
          content: Text(
            "Are you sure you want to release ${spot.name} spot? Once confirmed, your session will end, and you'll be directed to the payment page.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Confirm"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  bookingHistory.add(ongoingBookings[index]);
                  ongoingBookings.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  void _showTimerDialog(BuildContext context, ParkingSpot spot) {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            final startTime = spot.startTime;

            // Use a Timer to update the dialog every second
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (!Navigator.of(context).canPop()) {
                timer.cancel(); // Stop the timer when the dialog is closed
              } else {
                setState(() {}); // Update the dialog state
              }
            });

            final elapsedTime = DateTime.now().difference(startTime);
            final hours = elapsedTime.inHours;
            final minutes = elapsedTime.inMinutes % 60;
            final seconds = elapsedTime.inSeconds % 60;

            return AlertDialog(
              title: const Text("Time Passed"),
              content: Text(
                "Time elapsed since parking started: ${hours}h ${minutes}m ${seconds}s.",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
