import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  @override
  State<LandingPageMobile> createState() {
    return _LandingPageMobileState();
  }
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  Widget _urlLauncher(String imagePath, String url) {
    return IconButton(
      icon: SvgPicture.asset(
        imagePath,
        width: 35,
        color: Colors.black,
      ),
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
    );
  }

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
            const DrawerHeader(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 110.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/image-2.png'),
                ),
              ),
            ),
            TabsMobile(text: 'Home', route: '/'),
            SizedBox(height: 20),
            TabsMobile(text: 'Works', route: '/works'),
            SizedBox(height: 20),
            TabsMobile(text: 'Blog', route: '/blog'),
            SizedBox(height: 20),
            TabsMobile(text: 'About', route: '/about'),
            SizedBox(height: 20),
            TabsMobile(text: 'Contact', route: '/contact'),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _urlLauncher(
                  'assets/instagram.svg',
                  'https://www.instagram.com/veng_eang',
                ),
                _urlLauncher(
                  'assets/github.svg',
                  'https://github.com/Veng-Eang',
                ),
                _urlLauncher(
                  'assets/twitter.svg',
                  'https://twitter.com/o_vengeang',
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          // Intro , First section
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 113.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/image-2.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: const SansBold('Hello I\'m', 15.0),
                    ),
                    SansBold('Vengeang', 40),
                    SansBold('Flutter Developer', 20.0),
                  ],
                ),
                const SizedBox(height: 15.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 3.0,
                      children: [
                        Icon(Icons.email),
                        Icon(Icons.call),
                        Icon(Icons.location_pin),
                      ],
                    ),
                    SizedBox(width: 20),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 8.0,
                      children: [
                        Sans('oengvengeang@gmail.com', 15.0),
                        Sans('+855 11 701 520', 15.0),
                        Sans('13/3, Phnom Penh, Cambodia', 15.0),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 90.0),
          // About me, Second section
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SansBold('About me', 35.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
