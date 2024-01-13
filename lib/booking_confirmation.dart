
import 'package:flutter/material.dart';
import 'room.dart';

class BookingConfirmation extends StatelessWidget {
  final Room room;

  BookingConfirmation({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking Confirmation',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green, // Customize the app bar color
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.greenAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Booking Confirmed for Room ${room.number}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true); // Indicate that booking is confirmed
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Button background color
                  onPrimary: Colors.green, // Text color
                ),
                child: Text('To Booked Rooms'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
