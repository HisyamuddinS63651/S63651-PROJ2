// room_form.dart
import 'package:flutter/material.dart';
import 'package:hotelmanagement_app/room.dart';

class RoomForm extends StatefulWidget {
  final Room? room;
  final Function(Room) onSubmit;

  RoomForm({this.room, required this.onSubmit});

  @override
  _RoomFormState createState() => _RoomFormState();
}

class _RoomFormState extends State<RoomForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(text: widget.room?.number.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.room == null ? 'Add Room' : 'Edit Room',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Room Number'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a room number';
                }
                return null;
              },
            ),
            SizedBox(height: 176),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  final room = Room(id: widget.room?.id ?? 0, number: int.parse(_numberController.text));
                  widget.onSubmit(room);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
