import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/image-2.png"),
              ),
            ),
            const SizedBox(height: 15.0),
            const SansBold("Veng-Eang", 30),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrlString(
                        "https://www.instagram.com/veng_eang");
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrlString("https://www.github.com/Veng-Eang");
                  },
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrlString("https://twitter.com/o_vengeang");
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    width: 35.0,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 500.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(size: 25.0, color: Colors.black),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/works.jpg",
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
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
            ];
          },
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 30.0),
                  SansBold("Works", 40.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                        imagePath: "assets/portfolio_screenshot.PNG",
                        height: 200.0,
                        width: 300.0,
                      ),
                      SizedBox(
                        width: widthDevice / 3,
                        child: Column(
                          children: [
                            SansBold("Portfolio", 30.0),
                            SizedBox(height: 15.0),
                            Sans(
                                "Deployed on Android, IOS and Web, the portfolio project was truly an achievement. I used Flutter to develop the beautiful and responsive UI and Firebase for Back-end.",
                                15.0)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
