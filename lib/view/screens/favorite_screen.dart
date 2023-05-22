import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("No Favorites"),
          SizedBox(height: 20,),
          Icon(Icons.heart_broken,size: 50,),
        ],
      ),),
    );
  }
}
