



import 'package:batna_traveler/view/admin/widgets/hotel/hotel_info_card.dart';
import 'package:flutter/material.dart';


Widget showMe (String pageTitle ,Widget child){
  if(pageTitle == "hotel"){
  return child;
  }else {
    return const SizedBox();
  }
}