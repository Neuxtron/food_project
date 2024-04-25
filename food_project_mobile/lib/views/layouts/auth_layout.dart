import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final List<Widget> children;
  const AuthLayout({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(.01),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_auth.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: children,
              ),
            ),
          )
        ],
      ),
    );
  }
}
