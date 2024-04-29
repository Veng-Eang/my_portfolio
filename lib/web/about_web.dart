import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            TabsWeb(
              title: "Home",
              route: "/",
            ),
            Spacer(),
            TabsWeb(
              title: "Works",
              route: "/works",
            ),
            Spacer(),
            TabsWeb(
              title: "Blog",
              route: "/blog",
            ),
            Spacer(),
            TabsWeb(
              title: "About",
              route: "/about",
            ),
            Spacer(),
            TabsWeb(
              title: "Contact",
              route: "/contact",
            ),
            Spacer(),
          ],
        ),
      ),
    ));
  }
}
