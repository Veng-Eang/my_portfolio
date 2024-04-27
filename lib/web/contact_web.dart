import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/image-2.png"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Veng-Eang", 30),
            SizedBox(height: 15.0),
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
                    "assets/contact_image.jpg",
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.0),
                SansBold("Contact me", 40.0),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                          text: "First Name",
                          hintText: "Please enter your first name",
                          containerWidth: 350.0,
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Email",
                          hintText: "Please enter your email",
                          containerWidth: 350.0,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          text: "Last Name",
                          hintText: "Please enter your last name",
                          containerWidth: 350.0,
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          text: "Phone number",
                          hintText: "Please enter your phone number",
                          containerWidth: 350.0,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                TextForm(
                  text: "Message",
                  hintText: "Please type your message",
                  containerWidth: widthDevice / 1.5,
                  maxLine: 10,
                ),
                SizedBox(height: 20.0),
                MaterialButton(
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: SansBold("Submit", 20.0),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          )),
    );
  }
}
