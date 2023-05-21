import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HotelInfoCard extends StatelessWidget {
  final String name, address, phone, image;
  final int rooms, id;
  final double rate;
  final int index;

  final bool isAdmin;

  const HotelInfoCard({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
    required this.rooms,
    required this.id,
    required this.rate,
    required this.image,
    required this.index,
    this.isAdmin = false,
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
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  image,
                  fit: BoxFit.fill,
                  width: 80,
                  height: 80,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Info(title: 'Name', data: name),
                        Info(title: 'Address', data: address),
                        Info(title: 'Phone', data: phone),
                        Info(title: 'Rooms', data: "$rooms"),
                        Info(title: 'Id', data: "$id"),
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
                      "$rate",
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
                          print("Delete In index $index");
                        },
                        icon: const Icon(Icons.delete))
                    : const SizedBox(width: 10,)
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
