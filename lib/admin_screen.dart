// admin_screen.dart
import 'package:flutter/material.dart';
import 'room_manager.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administrator'),
      ),
      body: RoomManager(),
    );
  }
}
