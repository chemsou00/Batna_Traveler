import 'package:batna_traveler/controller/admin/restaurant_controller.dart';
import 'package:batna_traveler/core/functions/valid_input.dart';
import 'package:flutter/material.dart';

class AddRestaurant extends StatelessWidget {
  const AddRestaurant({Key? key,required this.controller}) : super(key: key);

  final RestaurantController controller ;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                   return validInputAdmin(val!, 12, 8, "phone");
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
                   return validInputAdmin(val!, 10, 1, "rate");
                 },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                controller: controller.rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.star_rate),
                ),
              ),
              const SizedBox(height: 16.0),
               TextFormField(
                 validator: (val) {
                   return validInputAdmin(val!, 10, 1, "tables");
                 },
                controller: controller.tablesController,
                decoration: const InputDecoration(
                  labelText: 'Number of tables',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.hotel),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              SizedBox(height: 50,width: 100,
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
