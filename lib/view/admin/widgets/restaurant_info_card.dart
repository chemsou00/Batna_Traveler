



import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RestaurantInfoCard extends StatelessWidget {
  final String name, address, phone, image;
  final int tables, id;
  final double rate;

  const RestaurantInfoCard({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
    required this.tables,
    required this.id,
    required this.rate,
    required this.image,
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
          height: 100,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image,fit: BoxFit.fill,width: 80,),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: Get.size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Info(title: 'Name',data: name),
                      Info(title: 'Address',data: address),
                      Info(title: 'Phone',data: phone),
                      Info(title: 'tables',data: "$tables"),
                      Info(title: 'Id',data: "$id"),
                    ],
                  ),
                ),
                Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Rate",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "$rate",
                            style: const TextStyle(fontSize: 25),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow[600],
                          )
                        ],
                      ),
                    ))
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
  super.key,required this.title,
  required this.data, required ,
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