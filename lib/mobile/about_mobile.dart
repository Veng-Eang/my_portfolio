import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

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

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
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
                padding: EdgeInsets.only(bottom: 20.0),
                child: CircleAvatar(
                  radius: 117.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 113,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/image-2.png'),
                    ),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: const [
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/image-2.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
