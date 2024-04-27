import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
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
    return Scaffold(
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
      body: ListView(
        children: [
          //First page
          SizedBox(
            height: heightDevice - 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: const SansBold('Hello I\'m', 16),
                    ),
                    const SizedBox(height: 15),
                    const SansBold('Veng-Eang', 55.0),
                    const Sans('Flutter developer', 30.0),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20),
                        Sans('oengvengeang@gmail.com', 15.0),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20),
                        Sans('+855 11 701 520', 15.0),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20),
                        Sans('13/3, Phnom Penh, Cambodia', 15.0),
                      ],
                    ),
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
          //Second Page
          SizedBox(
            height: heightDevice / 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/web.jpg",
                  height: heightDevice / 1.8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SansBold("About me", 40.0),
                    const SizedBox(height: 15),
                    const Sans(
                        'Hello! I\'m Veng Eang I specialize in flutter development.',
                        15),
                    const Sans(
                        'I strive to ensure astounding performance with stae of ',
                        15),
                    const Sans(
                        'the art security for Android, Ios, Web, Mac, Linux and Windows',
                        15),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Flutter', 15.0),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Firebase', 15.0),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Android', 15.0),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Ios', 15.0),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Windows', 15.0),
                        ),
                        const SizedBox(width: 7),
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.tealAccent,
                              style: BorderStyle.solid,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Sans('Web', 15.0),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          //Third section
          SizedBox(
            height: heightDevice / 1.3,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/webL.png',
                      text: 'Web development',
                    ),
                    AnimatedCard(
                      imagePath: 'assets/app.png',
                      text: 'Application development',
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: 'assets/firebase.png',
                      text: 'Backend development',
                    ),
                  ],
                )
              ],
            ),
          ),
          //Fourth section
          SizedBox(
            height: heightDevice,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SansBold("Contect me", 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        TextForm(
                            text: 'First Name',
                            hintText: 'Please enter your first name',
                            containerWidth: 350),
                        SizedBox(height: 15),
                        TextForm(
                            text: "Email",
                            hintText: 'Please enter your email',
                            containerWidth: 350),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                            text: 'Last Name',
                            hintText: 'Please enter your last name',
                            containerWidth: 350),
                        SizedBox(height: 15),
                        TextForm(
                            text: 'Phone number',
                            hintText: 'Please enter phone number',
                            containerWidth: 350),
                      ],
                    ),
                  ],
                ),
                TextForm(
                  text: 'Message',
                  hintText: 'Please enter your message',
                  containerWidth: widthDevice / 1.5,
                  maxLine: 10,
                ),
                MaterialButton(
                  onPressed: () {},
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.tealAccent,
                  child: const SansBold('Submit', 20),
                )
              ],
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
