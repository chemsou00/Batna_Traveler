import 'dart:developer';

import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:batna_traveler/view/widgets/search_bar.dart';
import 'package:batna_traveler/view/widgets/spacer_between-categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          actions: const [
            Icon(Icons.notifications_none),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        drawer: const SafeArea(child: Drawer()),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBar(),
              const SizedBox(
                height: 10,
              ),
              SpacerBetween(
                title: "Categories",
                onTap: () {
                  log('See all Categories onTAPED');
                },
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      title: "Hotels",
                      onPressed: () {

                      },
                    ),
                    CategoryCard(
                      title: "Hotels",
                      onPressed: () {

                      },
                    ),
                    CategoryCard(
                      title: "Hotels",
                      onPressed: () {

                      },
                    ),
                    CategoryCard(
                      title: "Hotels",
                      onPressed: () {

                      },
                    ),
                    CategoryCard(
                      title: "Hotels",
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),
              SpacerBetween(
                  title: 'Events',
                  onTap: () {
                    log('See all Events onTAPED');
                  }),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: const <Widget>[
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                    EventCard(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://loveincorporated.blob.core.windows.net/contentimages/gallery/01f7fdd8-368c-41eb-817d-1bca7d873ccb-38-moraine-lake.jpg',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.6),
                child: const Text(
                    style: TextStyle(color: Colors.white),
                    "He'd have you all unravel at the"),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: IconButton(
                  onPressed: () {
                    log("message");
                  },
                  icon: const Icon(Icons.favorite_outline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton.icon(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.cyan),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20))),
          onPressed: onPressed,
          icon: const Icon(Icons.hotel),
          label: Text(title)),
    );
  }
}
