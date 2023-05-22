import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantInfoCard extends StatelessWidget {
  final List data ;
  final bool isAdmin;
  final int index ;

  const RestaurantInfoCard({
    super.key,
    this.isAdmin = false, required this.data, required this.index,
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
                  data[index]["r_image"],
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
                        Info(title: 'Name', data: data[index]["r_name"]),
                        Info(title: 'Address', data: data[index]["r_address"]),
                        Info(title: 'Phone', data: data[index]["r_phone"]),
                        Info(title: 'tables', data: data[index]["r_number_tabels"].toString()),
                        Info(title: 'Id', data: data[index]["r_id"].toString()),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Rate",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      data[index]["r_rank"].toString(),
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
                        onPressed: () {}, icon: const Icon(Icons.delete))
                    : const SizedBox(width: 10,),
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
