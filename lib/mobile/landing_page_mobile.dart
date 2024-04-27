import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  @override
  State<LandingPageMobile> createState() {
    return _LandingPageMobileState();
  }
}

class _LandingPageMobileState extends State<LandingPageMobile> {
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

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  mainAxisAlignment: MainAxisAlignment.start,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SansBold('About me', 35.0),
                const Sans(
                    'Hello! I\'m Vengeang Oeng I specialize in flutter development',
                    15.0),
                const Sans(
                    "I strive to ensure astounding performance with state of",
                    15.0),
                const Sans(
                    "the art security for Android, Ios, Web, Mac, Linux", 15.0),
                const SizedBox(height: 10),
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
          const SizedBox(height: 60.0),
          Column(
            children: [
              const SansBold("What I do?", 35.0),
              const AnimatedCard(
                imagePath: "assets/webL.png",
                text: "Web development",
                width: 300,
              ),
              const SizedBox(height: 35.0),
              const AnimatedCard(
                imagePath: "assets/app.png",
                text: "App development",
                width: 300,
                reverse: true,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 35.0),
              const AnimatedCard(
                imagePath: "assets/firebase.png",
                text: "Back-end development",
                width: 300,
              ),
              const SizedBox(height: 60.0),
              // Contact Forth section
              Wrap(
                spacing: 20.0,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  const SansBold("Contact me", 35.0),
                  TextForm(
                    text: "First Name",
                    hintText: "Please type first name",
                    containerWidth: deviceWidth / 1.4,
                  ),
                  TextForm(
                    text: "Last Name",
                    hintText: "Please type last name",
                    containerWidth: deviceWidth / 1.4,
                  ),
                  TextForm(
                    text: "Email",
                    hintText: "Please type email",
                    containerWidth: deviceWidth / 1.4,
                  ),
                  TextForm(
                    text: "Phone number",
                    hintText: "Please type phone number",
                    containerWidth: deviceWidth / 1.4,
                  ),
                  TextForm(
                    text: "Message",
                    hintText: "Please type message",
                    containerWidth: deviceWidth / 1.4,
                    maxLine: 10,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    color: Colors.tealAccent,
                    minWidth: deviceWidth / 2.2,
                    child: const SansBold("Submit", 20.0),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ],
          )
        ],
      ),
    );
  }
}
