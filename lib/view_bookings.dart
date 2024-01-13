// view_bookings.dart
import 'package:flutter/material.dart';
import 'room.dart';

class ViewBookings extends StatelessWidget {
  final List<Room> bookedRooms;

  ViewBookings({required this.bookedRooms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booked Rooms'),
        backgroundColor: Colors.blue,
      ),
      body: bookedRooms.isEmpty
          ? Center(
              child: Text(
                'No bookings made.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: bookedRooms.length,
              itemBuilder: (context, index) {
                final room = bookedRooms[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Room ${room.number} Booked',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'ID: ${room.id}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
