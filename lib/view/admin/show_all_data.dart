import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/search_bar.dart';

class ShowAllData extends StatelessWidget {
  const ShowAllData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Get.arguments["title"];
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('$title Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SearchBar(),
            Text(
              'All Result',
              style:
                  Theme.of(context).textTheme.titleLarge!.copyWith(height: 1.5),
            ),
            Flexible(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 5),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: 80,
                              //
                              child: Image.asset("assets/images/logo2.png"),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: Get.size.width * 0.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Name : Jawhara"),
                                Text(
                                  "Address : Alger Centre 1er Nov ",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text("Phone : 033556633"),
                                Text("Rooms : 100"),
                                Text("Id : 23"),
                              ],
                            ),
                          ),
                          const VerticalDivider(
                            color: Colors.black,
                            width: 2,
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
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                                ),
                                const Text(
                                  "4.2",
                                  style: TextStyle(fontSize: 25),
                                ),
                                Icon(Icons.star,color: Colors.yellow[600],)
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
