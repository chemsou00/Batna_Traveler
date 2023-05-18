import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard(
      {Key? key,
      required this.name,
      required this.phone,
      required this.email,
      required this.image,
      required this.id,
      required this.role})
      : super(key: key);
  final String name, phone, email, image;
  final int id, role;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5.0),
      elevation: 3,
      child: SizedBox(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                height: 90,
                width: 90,
                color: Colors.grey,child: const Icon(Icons.person,size: 50,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("User Name : "),
                  Text("User email : "),
                  Text("User phone : "),
                  Text("User id : "),
                  Text("User role : "),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert)
            ],
          )),
    );
  }
}
