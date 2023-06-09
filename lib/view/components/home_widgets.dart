import 'dart:developer';

import 'package:batna_traveler/view/admin/admin_panel_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    this.onTap,
  required this.title,
  required this.content,
  required this.image,
  required this.price,
  });

  final void Function()? onTap;
  final String title,content,image,price;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl:
                  image,
              placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 1.5,
              )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            maxLines: 1,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            content,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50, width: 50,
                      // color: Colors.green,
                      child: Text(
                        "$price \$",
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
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
    this.onPressed,
    required this.index,
    required this.iconData, required this.title,
  });

  final int index;
  final void Function()? onPressed;
  final IconData iconData;
  final String title;

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
          icon: Icon(iconData),
          label: Text(title)),
    );
  }
}
