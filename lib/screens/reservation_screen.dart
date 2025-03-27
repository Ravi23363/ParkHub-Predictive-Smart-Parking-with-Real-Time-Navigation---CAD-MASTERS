import 'package:flutter/material.dart';
import 'package:parkhub/screens/selectvehicle_screen.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  ReservationScreenState createState() => ReservationScreenState();
}

class ReservationScreenState extends State<ReservationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String selectedSlot = "B1";
  List<String> bookedSlots = ["A0", "A3", "A4", "A6", "B0", "B3", "B5", "B7"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text("Select Your Slot"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              isScrollable: true,
              tabs: const [
                Tab(text: "1st Floor"),
                Tab(text: "2nd Floor"),
                Tab(text: "3rd Floor"),
                Tab(text: "4th Floor"),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(4, (_) => _buildParkingLayout()),
              ),
            ),
          ),
          const SizedBox(height: 0),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.exit_to_app, color: Colors.blue),
              SizedBox(width: 5),
              Text(
                "Exit",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectVehicleScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Proceed with $selectedSlot slot",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParkingLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.directions_car, color: Colors.blue),
            SizedBox(width: 5),
            Text(
              "Entry",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildParkingColumn("A"),
            const SizedBox(width: 30),
            _buildParkingColumn("B"),
          ],
        ),
      ],
    );
  }

  Widget _buildParkingColumn(String column) {
    return Column(
      children: List.generate(9, (index) {
        String slot = "$column$index";
        bool isBooked = bookedSlots.contains(slot);
        bool isSelected = slot == selectedSlot;

        return GestureDetector(
          onTap:
              isBooked
                  ? null
                  : () {
                    setState(() {
                      selectedSlot = slot;
                    });
                  },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: 80,
            height: 40,
            decoration: BoxDecoration(
              color:
                  isBooked
                      ? Colors.blue.shade800
                      : (isSelected ? Colors.blue : Colors.white),
              border: Border.all(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child:
                isBooked
                    ? const Icon(Icons.directions_car, color: Colors.white)
                    : Text(
                      slot,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.blue,
                        fontSize: 16,
                      ),
                    ),
          ),
        );
      }),
    );
  }
}
