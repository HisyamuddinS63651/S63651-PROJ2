// booking_manager.dart
import 'package:flutter/material.dart';
import 'room.dart';
import 'booking_confirmation.dart';
import 'view_bookings.dart';
import 'main.dart'; 

class BookingManager extends StatefulWidget {
  @override
  _BookingManagerState createState() => _BookingManagerState();
}

class _BookingManagerState extends State<BookingManager> {
  List<Room> availableRooms = List.generate(
    5, // Adjust the number of rooms as needed
    (index) => Room(id: index + 1, number: 100 + index),
  );

  List<Room> bookedRooms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Manager',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
        backgroundColor: Colors.blue, // Customize the app bar color
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: availableRooms.length,
              itemBuilder: (context, index) {
                final room = availableRooms[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Room ${room.number} Available',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'ID: ${room.id}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    onTap: () {
                      _bookRoom(context, room);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _bookRoom(BuildContext context, Room room) {
    setState(() {
      bookedRooms.add(room);
      availableRooms.remove(room);
    });

    _navigateToBookingConfirmation(context, room);
  }

  void _navigateToBookingConfirmation(BuildContext context, Room room) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmation(room: room),
      ),
    ).then((value) {
      _showViewBookings(context);
    });
  }

  void _showViewBookings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewBookings(bookedRooms: bookedRooms),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
