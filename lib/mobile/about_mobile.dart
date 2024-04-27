import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

Widget tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: EdgeInsets.all(7.0),
    child: Text(
      text,
      style: GoogleFonts.openSans(fontSize: 15.0),
    ),
  );
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
                    backgroundImage: AssetImage("assets/image-2.png"),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SansBold('About me', 35.0),
                    const SizedBox(height: 15.0),
                    const Sans(
                        'Hello! I\'m Vengeang Oeng I specialize in flutter development',
                        15.0),
                    const Sans(
                        "I strive to ensure astounding performance with state of",
                        15.0),
                    const Sans(
                        "the art security for Android, Ios, Web, Mac, Linux",
                        15.0),
                    const SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer('Flutter'),
                        tealContainer('Firebase'),
                        tealContainer('Abdroid'),
                        tealContainer('Windows'),
                        tealContainer('Web'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              // Web development , second section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/webL.png",
                    width: 200.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold("Web Development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              const Sans(
                  "I'm here to build your presence online with state of the art web apps",
                  15.0),

              //App development , third section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("App Development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              const Sans(
                  "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                  15.0),

              // Back-end development  forth section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/firebase.png",
                    width: 200.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("Back-end Development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              const Sans(
                  "Do you want your back-end to be highly scalable and cecure? Let's have a conversation on how I can help help you with that.",
                  15.0),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
