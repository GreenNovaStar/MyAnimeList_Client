import 'package:flutter/material.dart';

import 'API/User/user_class.dart';

class ProfilePage extends StatelessWidget {

  User user;
  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${user.name}'s profile page"),),
      body: const Center(child: Text("Hello World"),),
    );
  }
}
