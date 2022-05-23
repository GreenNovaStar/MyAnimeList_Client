import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/User/User_Helper_Class/user_class.dart';
import 'package:mal_client_v2/API/User/user_api_calls.dart';
import 'package:mal_client_v2/User/user_const.dart';

Widget HeaderRow(Size size) {
  return FutureBuilder(
    future: getUserDetails(),
    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        if (snapshot.hasData) {
          User user = snapshot.data ?? defaultUser;
          return Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(10),
            //       topRight: Radius.circular(10),
            //       bottomLeft: Radius.circular(10),
            //       bottomRight: Radius.circular(10)),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 5,
            //       blurRadius: 7,
            //       offset: Offset(0, 3), // changes position of shadow
            //     ),
            //   ],
            // ),
            height: size.height * 0.16,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  // child: GreetingMessage(user, context),
                  child: GreetingMessage(
                    user: user,
                  ),
                ),
                CircleAvatar(
                  // radius: size.height * 0.05,
                  radius: size.width * 0.13,
                  backgroundImage: NetworkImage(user.picture),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(
                  child: Text(
                      "An Error Has Occured.\nError is ${snapshot.error.toString()}")));
        }
      } else if (snapshot.connectionState == ConnectionState.waiting) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
        // return Container();
      } else {
        print("no data received");
        // ignore: sized_box_for_whitespace
        return const Center(
          child: Text("No Data Received"),
        );
      }
      return const SizedBox.shrink();
    },
  );
}

// ignore: must_be_immutable
class GreetingMessage extends StatelessWidget {
  User user;

  GreetingMessage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: "Welcome:\n",
            style: TextStyle(
                fontSize: 28, color: Theme.of(context).primaryColorLight),
          ),
          TextSpan(
            text: user.name,
            // text: "User",
            style: TextStyle(
                fontSize: 28, color: Theme.of(context).primaryColorLight),
          ),
        ]),
      ),
    );
  }
}
