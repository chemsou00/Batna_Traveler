import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen(
      {Key? key,
      required this.content,
      required this.title,
      required this.image,
      required this.price,
      required this.dateStart,
      required this.dateEnd})
      : super(key: key);
  final String content, title, image, price, dateStart, dateEnd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Event Screen"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                // boxShadow: [
                //   BoxShadow(color: Colors.black,offset: Offset(2,2 ),blurRadius: 5.0,)
                // ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0))),
            child: CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 1.5,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$price\$',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Description : ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(content, style: TextStyle(fontSize: 14)),
                const SizedBox(
                  height: 10,
                ),
                Text("Date : ",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ListTile(
                  title: Text(dateStart),
                  subtitle: Text("startDate"),
                  trailing: Icon(Icons.date_range),
                ),
                ListTile(
                  title: Text(dateEnd),
                  subtitle: Text("EndDate"),
                  trailing: Icon(Icons.date_range),
                ),
                SizedBox(height: 50,
                  child: ElevatedButton.icon(
                    label: Text('Add To Favorite'),
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
