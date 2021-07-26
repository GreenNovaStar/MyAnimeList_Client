import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:myanimelist_client/API/User/user_class.dart';

class ProfilePage extends StatelessWidget {
  User user;

  ProfilePage({required this.user});

  // ignore: non_constant_identifier_names
  Widget ProfileHeader(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(user.joinedAt.toString());
    DateTime dateTime = DateTime.parse(user.joinedAt);
    // var dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss").format(dateTime);
    var dateFormatted = DateFormat.yMMMMEEEEd().format(dateTime);
    // print("date formatted = $dateFormatted");
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilePicture(size),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(user.name, style: TextStyle(fontSize: 24),),
              Text("User Joined:\n\t$dateFormatted"),
              // if(user.location != "") Text(user.location),
            ],
          ),
        )
      ],
    );
  }

  Widget ProfilePicture(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.width * 0.4,
        width: size.width * 0.4,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 4,
              ),
              // borderRadius: BorderRadius.circular(10.0),
              color: Colors.black),
          // color: Colors.black,
          child: user.picture != ""
              ? Image.network(
                  user.picture,
                  alignment: Alignment.center,
                )
              : Image.asset(
                  'assets/images/myanimelist_logo_short.png',
                  height: 130,
                  width: 90,
                  alignment: Alignment.center,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(user.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name}'s Profile"),
      ),
      // body: const Center(child: Text("Hello World"),),
      body: ProfileHeader(context),
    );
  }
}
