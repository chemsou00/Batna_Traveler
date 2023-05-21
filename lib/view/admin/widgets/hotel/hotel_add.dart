import 'package:batna_traveler/controller/admin/hotel_controller.dart';
import 'package:batna_traveler/core/functions/valid_input.dart';
import 'package:flutter/material.dart';

class AddHotel extends StatelessWidget {
  const AddHotel({Key? key, required this.controller}) : super(key: key);
  final HotelController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 40, 5, "name");
                },
                textInputAction: TextInputAction.next,
                controller: controller.nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 40, 5, "address");
                },
                textInputAction: TextInputAction.next,
                controller: controller.addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 40, 5, "phone");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                controller: controller.phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 5, 1, "rooms");
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                controller: controller.roomsController,
                decoration: const InputDecoration(
                  labelText: 'Number of Rooms',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.hotel),
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                validator: (val) {
                  return validInputAdmin(val!, 5, 1, "rate");
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                // controller: roomsController.toInt(),
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.star_rate),
                ),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    controller.onSubmition();
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
