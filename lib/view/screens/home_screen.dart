import 'dart:developer';

import 'package:batna_traveler/view/components/custom_drawer.dart';
import 'package:batna_traveler/view/components/home_widgets.dart';
import 'package:batna_traveler/view/components/search_bar.dart';
import 'package:batna_traveler/view/components/spacer_between-categories.dart';
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
        drawer: const SafeArea(child: CustomDrawer()),
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
                      onPressed: () {},
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
