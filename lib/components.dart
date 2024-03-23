import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWeb extends StatefulWidget {
  const TabWeb({
    super.key,
    required this.title,
    required this.route,
  });

  final String title;
  final String route;
  @override
  State<TabWeb> createState() => _TabWebState();
}

class _TabWebState extends State<TabWeb> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          curve: Curves.elasticIn,
          style: _isSelected
              ? GoogleFonts.oswald(
                  shadows: [
                    const Shadow(
                      color: Colors.black,
                      offset: Offset(0, -6),
                    )
                  ],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent,
                )
              : GoogleFonts.oswald(fontSize: 23.0, color: Colors.black),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  const TabsMobile({
    super.key,
    required this.text,
    required this.route,
  });
  final String text;
  final String route;
  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.text,
        style: GoogleFonts.openSans(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class SansBold extends StatelessWidget {
  const SansBold(this.text, this.size, {super.key});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  const Sans(this.text, this.size, {super.key});
  final String text;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.text,
    required this.hintText,
    required this.containerWidth,
    this.maxLine,
  });
  final String text;
  final String hintText;
  final double containerWidth;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(text, 16.0),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            // inputFormatters: [
            //   LengthLimitingTextInputFormatter(10),
            //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
            // ],
            maxLines: maxLine,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(fontSize: 14),
            ),
            validator: (text) {
              if (RegExp("\\bvengeang\\b", caseSensitive: false)
                  .hasMatch(text.toString())) {
                return "Match Found";
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        )
      ],
    );
  }
}

class AnimatedCardWeb extends StatefulWidget {
  const AnimatedCardWeb({
    super.key,
    required this.imagePath,
    required this.text,
    this.fit,
    this.reverse,
    this.height,
    this.width,
  });
  final String imagePath;
  final String text;
  final BoxFit? fit;
  final bool? reverse;
  final double? height;
  final double? width;

  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: const BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                width: widget.width ?? 200.0,
                height: widget.height ?? 200.0,
                fit: widget.fit,
              ),
              const SizedBox(height: 10),
              SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
