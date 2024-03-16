import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class TabWeb extends StatefulWidget {
  const TabWeb(this.title, {super.key});

  final title;
  @override
  State<TabWeb> createState() => _TabWebState();
}

class _TabWebState extends State<TabWeb> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
    required this.heading,
    required this.hintText,
    required this.width,
    this.maxLine,
  });
  final String heading;
  final String hintText;
  final double width;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Sans(heading, 16.0),
        SizedBox(
          width: width,
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
  AnimatedCardWeb({
    super.key,
    required this.imagePath,
    required this.text,
    this.fit,
    this.reverse,
  });
  final String imagePath;
  final String text;
  final BoxFit? fit;
  final bool? reverse;
  @override
  State<AnimatedCardWeb> createState() => _AnimatedCardWebState();
}

class _AnimatedCardWebState extends State<AnimatedCardWeb>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  );

  late final Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
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
                width: 200,
                height: 200,
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
