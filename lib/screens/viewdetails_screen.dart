import 'package:flutter/material.dart';
import 'package:parkhub/screens/reservation_screen.dart';

class ViewDetailScreen extends StatelessWidget {
  const ViewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Parking Image with Bookmark Icon
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/ioiparkingP1.jpeg',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: IconButton(
                        icon: Icon(Icons.bookmark_border, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                // Parking Details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "IOI City Mall Parking",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: Text("More image"),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Lebuh IRC, IOI Resort City, 62502 Putrajaya, Sepang, Selangor",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "RM3 (1st hour)",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Icon(Icons.directions_car, color: Colors.blue),
                          SizedBox(width: 5),
                          Text("24 Slot"),
                          Spacer(),
                          Icon(Icons.star, color: Colors.amber),
                          Text("4.5"),
                        ],
                      ),
                    ],
                  ),
                ),

                // Information Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Information",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "OI City Mall\nCovered - 7605 spots\nMYR3\n2 hours\nGet Directions\nIOI City Mall Sdn Bhd\nLebuh IRC\n62502 Kampung Sungai Buah\n+60 3-8328 8900\nhttp://www.ioicitymall.com.my/location-getting-here/",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Features",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Icon(Icons.accessible, color: Colors.blue),
                              Text("Disabled spots"),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Icon(Icons.height, color: Colors.blue),
                              Text("Height: 2.10m"),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Icon(Icons.electric_car, color: Colors.blue),
                              Text("EV Charging"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Prices",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Mon-Fri: 1st Hour MYR2.00, Add. Hour MYR1.00\nSat-Sun: 1st Hour MYR4.00, Add. Hour MYR1.00",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Payment Options",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pay On Foot, Cards, Phone, Cash",
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Premier Parking",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Weekdays: RM15.00/3hrs, RM2.00/sub. hr\nHolidays: RM20.00/3hrs, RM2.00/sub. hr",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.event_available),
                    label: Text("Reserve Parking"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement Get Directions action
                    },
                    icon: const Icon(Icons.directions, size: 14),
                    label: const Text(
                      "Directions",
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 35,
                      ),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
