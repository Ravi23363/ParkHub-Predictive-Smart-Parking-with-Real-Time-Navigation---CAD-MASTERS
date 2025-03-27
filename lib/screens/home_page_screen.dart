import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkhub/screens/profile_screen.dart';
import 'package:parkhub/screens/booking_screen.dart';
import 'package:parkhub/screens/saved_screen.dart';
import 'package:parkhub/screens/viewdetails_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  HomepageScreenState createState() => HomepageScreenState();
}

class HomepageScreenState extends State<HomepageScreen> {
  late GoogleMapController mapController;
  final LatLng _initialLocation = const LatLng(2.96915355, 101.712473736689);

  // List of parking markers
  final List<Marker> _markers = [];
  bool _showFilter = false;
  double _distance = 20;
  double _price = 20;
  int _rating = 5;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    _addParkingMarkers();
  }

  void _addParkingMarkers() {
    setState(() {
      _markers.addAll([
        Marker(
          markerId: const MarkerId("parking1"),
          position: const LatLng(2.96915355, 101.712473736689),
          infoWindow: const InfoWindow(
            title: "IOI City Mall",
            snippet: "RM3 (1st hour)",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ),
        Marker(
          markerId: const MarkerId("parking2"),
          position: const LatLng(2.9395, 101.7106),
          infoWindow: const InfoWindow(
            title: "Alamanda Shopping Centre",
            snippet: "RM2.50 (1st hour)",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        ),
        Marker(
          markerId: const MarkerId("parking3"),
          position: const LatLng(3.025340, 101.617767),
          infoWindow: const InfoWindow(
            title: "Kompleks Anjung",
            snippet: "RM2 (1st hour)",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _initialLocation,
                zoom: 16.8,
              ),
              zoomGesturesEnabled: true,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: Set<Marker>.of(_markers),
            ),
          ),

          // Profile & Search Section
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section (Clickable)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage(
                          'assets/images/kirthiraj.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Kirthiraj",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Find your parking spots",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                      icon: const Icon(Icons.search, color: Colors.white),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _showFilter = !_showFilter;
                          });
                        },
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Add this inside the Stack widget
          Positioned(
            bottom: 400, // Adjust position
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.orange,
              child: const Icon(Icons.view_in_ar, color: Colors.white),
            ),
          ),

          // Scrollable Parking Spaces
          Positioned(
            bottom: 65,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(3, (index) {
                    final List<String> images = [
                      'assets/images/ioiparkingP1.jpeg',
                      'assets/images/alamandaparking.png',
                      'assets/images/anjungparking.jpg',
                    ];
                    final List<String> names = [
                      "IOI City Mall Parking",
                      "Alamanda Shopping Centre Parking",
                      "Kompleks Anjung",
                    ];
                    final List<String> locations = [
                      "Lebuh IRC, IOI Resort City, 62502 Putrajaya, Sepang, Selangor",
                      "Jalan Alamanda, Presint 1, 62000 Putrajaya, Wilayah Persekutuan",
                      "Persiaran Sultan Sallahuddin Abdul Aziz Shah, Presint 1, 62000 Putrajaya, Wilayah Persekutuan",
                    ];
                    final List<String> prices = [
                      "RM3.00 (1st hour)",
                      "RM2.50 (1st hour)",
                      "RM2.00 (1st hour)",
                    ];
                    final List<double> ratings = [4.5, 4.2, 3.8];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .center, // Centers items vertically
                            children: [
                              // Image & Rating (Centered)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      images[index],
                                      width: 80,
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
                                      color: const Color.fromRGBO(
                                        33,
                                        150,
                                        243,
                                        1,
                                      ),
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
                                          ratings[index].toString(),
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
                              const SizedBox(width: 10),

                              // Parking Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center, // Centers content vertically
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            names[index],
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        // Bookmark Icon
                                        StatefulBuilder(
                                          builder: (context, setState) {
                                            return IconButton(
                                              icon: Icon(
                                                isBookmarked
                                                    ? Icons.bookmark
                                                    : Icons.bookmark_border,
                                                color:
                                                    isBookmarked
                                                        ? Colors.blue
                                                        : Colors.grey,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  isBookmarked = !isBookmarked;
                                                });
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Text(
                                      locations[index],
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      prices[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    // EV Charging Availability for the first location
                                    if (index == 0)
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.electric_car,
                                            color: Colors.green,
                                            size: 16,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            "EV Charging Available",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(height: 8),
                                    // Buttons Row: Swapped "View Details" & "Get Directions"
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        ViewDetailScreen(),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.info,
                                            size: 14,
                                          ),
                                          label: const Text(
                                            "Details",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 10,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton.icon(
                                          onPressed: () {
                                            // Implement Get Directions action
                                          },
                                          icon: const Icon(
                                            Icons.directions,
                                            size: 14,
                                          ),
                                          label: const Text(
                                            "Directions",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blue,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 10,
                                            ),
                                            textStyle: const TextStyle(
                                              fontSize: 12,
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
                  }),
                ),
              ),
            ),
          ),

          // Filter Section
          if (_showFilter)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Distance Slider
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Distance: ${_distance.toStringAsFixed(1)} km",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Slider(
                            value: _distance,
                            min: 1,
                            max: 50,
                            divisions: 25,
                            onChanged: (value) {
                              setState(() {
                                _distance = value;
                              });
                            },
                          ),
                        ],
                      ),

                      // Price Slider
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price: RM${_price.toStringAsFixed(0)}",
                            style: const TextStyle(fontSize: 16),
                          ),
                          Slider(
                            value: _price,
                            min: 1,
                            max: 30,
                            divisions: 20,
                            onChanged: (value) {
                              setState(() {
                                _price = value;
                              });
                            },
                          ),
                        ],
                      ),

                      // Rating Selection with Box & Icons
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Rating:", style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(5, (index) {
                              bool isSelected = (_rating == index + 1);
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _rating = index + 1;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.blue
                                            : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.blue
                                              : Colors.grey,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.amber,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _distance = 50;
                                _price = 50;
                                _rating = 5;
                              });
                            },
                            child: const Text("Clear All"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _showFilter = false;
                              });
                            },
                            child: const Text("Apply"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookingScreen()),
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
