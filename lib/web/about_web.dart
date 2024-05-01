import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
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

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 72,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 72,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/image-2.png'),
                ),
              ),
              const SizedBox(height: 15),
              const SansBold('vengeang', 30.0),
              const SizedBox(height: 15),
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            size: 25.0,
            color: Colors.black,
          ),
          title: const Row(
            children: [
              Spacer(flex: 3),
              TabsWeb(title: "Home", route: "/"),
              Spacer(),
              TabsWeb(title: "Works", route: "/works"),
              Spacer(),
              TabsWeb(title: "Blog", route: "/blog"),
              Spacer(),
              TabsWeb(title: "About", route: "/about"),
              Spacer(),
              TabsWeb(title: "Contact", route: "/contact"),
              Spacer(),
            ],
          ),
        ),
        body: ListView(
          children: [
            // About me, first section
            SizedBox(
              height: 500.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SansBold("About me", 40.0),
                      const SizedBox(height: 15.0),
                      const Sans(
                        "Hello! I'm Veng-Eang I specialize in flutter development",
                        15.0,
                      ),
                      const Sans(
                        "I strive to ensure astounding performace with state of",
                        15.0,
                      ),
                      const Sans(
                        "the art security for Android, Ios, Web, Mac, Linux and Windows",
                        15.0,
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          tealContainer("Flutter"),
                          const SizedBox(width: 7.0),
                          tealContainer("Firebase"),
                          const SizedBox(width: 7.0),
                          tealContainer("Android"),
                          const SizedBox(width: 7.0),
                          tealContainer("IOS"),
                          const SizedBox(width: 7.0),
                          tealContainer("Windows"),
                          const SizedBox(width: 7.0),
                        ],
                      )
                    ],
                  ),
                  const CircleAvatar(
                    radius: 147.0,
                    backgroundColor: Colors.tealAccent,
                    child: CircleAvatar(
                      radius: 143.0,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 140.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/image-2.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Web development, Second section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AnimatedCard(
                    imagePath: "assets/webL.png", height: 250.0, width: 250.0),
                SizedBox(
                  width: widthDevice / 3,
                  child: const Column(
                    children: [
                      SansBold("Web develpment", 30.0),
                      SizedBox(height: 15.0),
                      Sans(
                          "I'm here to build your presence online with  state of the art web apps",
                          15.0)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),

            // App development, third section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: widthDevice / 3,
                  child: const Column(
                    children: [
                      SansBold("App develpment", 30.0),
                      SizedBox(height: 15.0),
                      Sans(
                          "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                          15.0)
                    ],
                  ),
                ),
                const AnimatedCard(
                  imagePath: "assets/app.png",
                  height: 250.0,
                  width: 250.0,
                  reverse: true,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            // Back-end development, fourth section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AnimatedCard(
                    imagePath: "assets/firebase.png",
                    height: 250.0,
                    width: 250.0),
                SizedBox(
                  width: widthDevice / 3,
                  child: const Column(
                    children: [
                      SansBold("Back-end develpment", 30.0),
                      SizedBox(height: 15.0),
                      Sans(
                          "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                          15.0)
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
