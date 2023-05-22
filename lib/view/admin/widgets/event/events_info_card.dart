import 'package:flutter/material.dart';

class EventInfoCard extends StatelessWidget {
  const EventInfoCard(
      {Key? key, this.isAdmin = false, required this.data, required this.index})
      : super(key: key);
  final bool isAdmin;

  final List data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 80,
              color: Colors.grey,
              height: 80,
              child: Image.network(
                data[index]["event_image"],
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Info(title: 'Title', data: data[index]["event_title"]),
                    Info(title: 'Price', data: data[index]["event_price"]+' \$'),
                    Info(title: 'Start', data: data[index]["event_start"]),
                    Info(title: 'End', data: data[index]["event_end"]),
                    Info(title: 'id', data: data[index]["event_id"].toString()),
                  ],
                ),
              ),
            ),
            isAdmin
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                : const SizedBox(),
          ],
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
