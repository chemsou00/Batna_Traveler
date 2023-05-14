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
                  child: const SizedBox(
                    height: 100,
                    width: double.infinity,
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
