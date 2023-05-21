import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHotel extends StatelessWidget {
  const AddHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const TextField(
            textInputAction: TextInputAction.next,
            // controller: nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
              textInputAction: TextInputAction.next,
              // controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            // controller: phoneController,
            decoration: InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            // controller: roomsController.toInt(),
            decoration: InputDecoration(
              labelText: 'Number of Rooms',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.hotel),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            // controller: roomsController.toInt(),
            decoration: InputDecoration(
              labelText: 'Rate',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.star_rate),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // String name = nameController.text;
              // String address = addressController.text;
              // String phone = phoneController.text;
              // String rooms = roomsController.text;
              //
              // // Do something with the form values
              // print('Name: $name');
              // print('Address: $address');
              // print('Phone: $phone');
              // print('Number of Rooms: $rooms');
            },
            child: const Text('Submit'),
          ),
        ],),
    );
  }
}
