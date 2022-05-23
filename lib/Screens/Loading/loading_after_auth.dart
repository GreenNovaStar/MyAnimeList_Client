import 'package:flutter/material.dart';

class LoadingAfterAuth extends StatelessWidget {
  const LoadingAfterAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LinearProgressIndicator(),
      ),
    );
  }
}
