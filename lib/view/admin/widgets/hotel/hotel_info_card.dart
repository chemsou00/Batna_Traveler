import 'package:batna_traveler/controller/admin/hotel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelInfoCard extends StatelessWidget {
  final bool isAdmin;
  final List data;
  final int index;
  final HotelController controller;

  const HotelInfoCard({
    super.key,
    this.isAdmin = false,
    required this.data,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  data[index]["h_image"],
                  fit: BoxFit.fill,
                  width: 80,
                  height: 80,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Info(
                          title: 'Name',
                          data: data[index]["h_name"],
                        ),
                        Info(
                          title: 'Address',
                          data: data[index]["h_address"],
                        ),
                        Info(
                          title: 'Phone',
                          data: data[index]["h_phone"].toString(),
                        ),
                        Info(
                          title: 'Rooms',
                          data: data[index]["h_number_rooms"].toString(),
                        ),
                        Info(
                          title: 'Id',
                          data: data[index]["h_id"].toString(),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Rate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      data[index]["h_rank"].toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[600],
                    )
                  ],
                ),
                isAdmin
                    ? IconButton(
                        onPressed: () {
                          controller.showDeleteAlert(
                            data[index]["h_id"],
                            data[index]["h_name"],
                          );
                          //print("Delete In index $index");
                        },
                        icon: const Icon(Icons.delete))
                    : const SizedBox(
                        width: 10,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.data,
    required,
  });

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title : $data ",
      overflow: TextOverflow.ellipsis,
    );
  }
}
