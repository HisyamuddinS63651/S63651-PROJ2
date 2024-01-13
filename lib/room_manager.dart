// room_manager.dart
import 'package:flutter/material.dart';
import 'room.dart';
import 'room_form.dart';
import 'main.dart';

class RoomManager extends StatefulWidget {
  @override
  _RoomManagerState createState() => _RoomManagerState();
}

class _RoomManagerState extends State<RoomManager> {
  List<Room> rooms = [
    Room(id: 1, number: 101),
    Room(id: 2, number: 102),
    // Add more rooms as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Manager'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              _showRoomForm(context);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.hotel, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Add Room',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      'Room ${rooms[index].number}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'ID: ${rooms[index].id}',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            _showRoomForm(context, room: rooms[index]);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_forever, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              rooms.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _showRoomForm(BuildContext context, {Room? room}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return RoomForm(
          room: room,
          onSubmit: (room) {
            setState(() {
              if (room.id == 0) {
                rooms.add(Room(id: rooms.length + 1, number: room.number));
              } else {
                final index = rooms.indexWhere((r) => r.id == room.id);
                if (index != -1) {
                  rooms[index] = room;
                }
              }
            });
          },
        );
      },
    );
  }
}
