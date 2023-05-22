import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key? key,
    required this.data,
    required this.index,
    this.isAdmin = true,
  }) : super(key: key);
  final List data;

  final int index;
  final bool isAdmin;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 80,
              color: Colors.grey,
              height: 80,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Info(title: 'name', data: data[index]["user_name"]),
                    Info(title: 'email', data: data[index]["user_email"]),
                    Info(title: 'phone', data: data[index]["user_phone"]),
                    Info(title: 'role', data: (data[index]["user_role"]== 1)?"Admin" : "Normal"),
                    Info(title: 'id', data: data[index]["user_id"].toString()),
                  ],
                ),
              ),
            ),
            isAdmin
                ? IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    super.key,
    required this.title,
    required this.data,
    required,
  });

  final String data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title : $data ",
      overflow: TextOverflow.ellipsis,
    );
  }
}
