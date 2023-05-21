import 'package:flutter/material.dart';

class AddRestaurant extends StatelessWidget {
  const AddRestaurant({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
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
            // controller: phoneController,
            decoration: InputDecoration(
              labelText: 'Phone',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            // controller: rateController.toInt(),
            decoration: InputDecoration(
              labelText: 'Rate',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.star_rate),
            ),
          ),
          const SizedBox(height: 16.0),
          const TextField(
            // controller: roomsController,
            decoration: InputDecoration(
              labelText: 'Number of tables',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.hotel),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
