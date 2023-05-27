import 'package:batna_traveler/view/components/search_field-decoration.dart';
import 'package:flutter/material.dart';


class MySearchBar extends StatelessWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          enabled: false,
          decoration: searchField.copyWith(),
        ),
      ),
    )
    ;
  }
}
