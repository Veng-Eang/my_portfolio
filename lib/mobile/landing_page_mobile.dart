import 'package:flutter/material.dart';

class LandingPageMobile extends StatefulWidget {
  @override
  State<LandingPageMobile> createState() {
    return _LandingPageMobileState();
  }
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 35.0, color: Colors.black),
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black),
                ),
                child: Image.asset('assets/profile2-circle.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
