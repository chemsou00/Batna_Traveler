import 'package:batna_traveler/config/constants/app_colors.dart';
import 'package:flutter/material.dart';

InputDecoration searchField = const InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    icon: Icon(Icons.search),
    iconColor: Colors.black,

    hintText: 'Search',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      gapPadding: 5,
    ));
