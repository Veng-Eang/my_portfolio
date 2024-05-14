import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksMobile extends StatefulWidget {
  const WorksMobile({super.key});

  @override
  State<WorksMobile> createState() => _WorksMobileState();
}

class _WorksMobileState extends State<WorksMobile> {
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
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
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
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 400.0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    size: 35.0,
                    color: Colors.black,
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.asset(
                      "assets/works.jpg",
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.0),
                    SansBold("Works", 35.0),
                    SizedBox(height: 20.0),
                    AnimatedCard(
                      imagePath: "assets/portfolio_screenshot.PNG",
                      fit: BoxFit.contain,
                      height: 150,
                      width: 300.0,
                    ),
                    SizedBox(height: 30.0),
                    SansBold("Portfolio", 20.0),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Sans(
                          "Deployed on Android,IOS and Web, the portfolio projecet was truly an achivement.I used Flutter to develep the beautiful and responsive UI and Firebase for Back-end.",
                          15.0),
                    ),
                  ],
                )
              ],
            )));
  }
}
