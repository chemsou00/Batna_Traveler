import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Event Screen $index"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Image.network(
              "https://www.romeartlover.it/Timgad11.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Text("Timgad",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
