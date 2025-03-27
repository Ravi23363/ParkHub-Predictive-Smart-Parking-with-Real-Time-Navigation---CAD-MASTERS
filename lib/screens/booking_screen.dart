import 'package:flutter/material.dart';
import 'package:parkhub/screens/home_page_screen.dart';
import 'package:parkhub/screens/profile_screen.dart';
import 'package:parkhub/screens/saved_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      name: 'IOI City Mall Parking',
      address: 'Lebuh IRC, IOI Resort City, 62502 Putrajaya, Sepang, Selangor',
      price: 'RM3 (1st hour)',
      distance: '1.2 km',
      slots: '45 slots',
      rating: 4.5,
      image: 'assets/images/ioiparkingP1.jpeg',
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
    ),
    ParkingSpot(
      name: 'Kompleks Anjung',
      address:
          'Persiaran Sultan Sallahuddin Abdul Aziz Shah, Presint 1, 62000 Putrajaya, Wilayah Persekutuan',
      price: 'RM1 (1st hour)',
      distance: '10.5 km',
      slots: '38 slots',
      rating: 4.1,
      image: 'assets/images/anjungparking.jpg',
    ),
    ParkingSpot(
      name: 'Sunway Pyramid Parking',
      address: 'Jalan PJS 11/15, Bandar Sunway, 47500 Subang Jaya, Selangor',
      price: 'RM5 (1st hour)',
      distance: '23.3 km',
      slots: '50 slots',
      rating: 4.7,
      image: 'assets/images/sunwayparking.jpg',
    ),
    ParkingSpot(
      name: 'Mid Valley Mega Mall Parking',
      address: 'Mid Valley City, Lingkaran Syed Putra, 59200 Kuala Lumpur',
      price: 'RM2.50 (1st hour)',
      distance: '15.3 km',
      slots: '40 slots',
      rating: 4.4,
      image: 'assets/images/midvalleyparking1.jpg',
    ),
  ];

  void _removeItem(int index) {
    setState(() {
      parkingSpots.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookmark"),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: parkingSpots.length,
        itemBuilder: (context, index) {
          final spot = parkingSpots[index];
          return Dismissible(
            key: Key(spot.name),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              _removeItem(index);
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Image and Rating Section - Centered Vertically
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            spot.image,
                            width: 80, // Slightly bigger image
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(33, 150, 243, 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                spot.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Details Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            spot.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            spot.address,
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 5), // Added gap
                          Text(
                            spot.price,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Distance: ${spot.distance}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "Slot Available: ${spot.slots}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(
                                    33,
                                    150,
                                    243,
                                    1,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  textStyle: const TextStyle(fontSize: 14),
                                ),
                                onPressed: () {
                                  // Implement booking action
                                },
                                child: const Text(
                                  "Reserve Parking",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
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
            ),
          );
        },
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
          } else if (index == 1) {
            // Index for Profile Icon
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SavedScreen()),
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
}

class ParkingSpot {
  final String name;
  final String address;
  final String price;
  final String distance;
  final String slots;
  final double rating;
  final String image;

  ParkingSpot({
    required this.name,
    required this.address,
    required this.price,
    required this.distance,
    required this.slots,
    required this.rating,
    required this.image,
  });
}
