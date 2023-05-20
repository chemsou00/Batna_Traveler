import 'package:flutter/material.dart';

class EventInfoCard extends StatelessWidget {
  const EventInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){},
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 80,
              color: Colors.grey,
              height: 80,
              child: const Icon(Icons.image,size: 50),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: const [
                  Text("Title"),
                  Text("Title"),
                  Text("Title"),
                  Text("Title"),
                  Text("Title"),
                  Text("Title"),
                ],
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
