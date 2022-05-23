import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_class.dart';
import 'package:mal_client_v2/Screens/HomePage/User/header.dart';

class GreetingHeader extends StatelessWidget {
  late User user;
  late Size size;

  GreetingHeader({Key? key, required this.user, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.16,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: GreetingMessage(
              user: user,
            ),
          ),
          CircleAvatar(
            radius: size.width * 0.13,
            backgroundImage: NetworkImage(user.picture),
          ),
        ],
      ),
    );
  }
}
