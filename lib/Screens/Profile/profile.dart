import 'package:flutter/material.dart';
import 'package:mal_client_v2/API/Authorization/user_authorization.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(tokenResponse.access_token);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: const Center(
        child: Text("Profile page"),
      ),
    );
  }
}
