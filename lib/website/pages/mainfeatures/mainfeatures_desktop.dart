import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_contents.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class MainfeaturesDesktop extends StatefulWidget {
  final MainfeaturesContents feature;

  const MainfeaturesDesktop({required this.feature, Key? key})
      : super(key: key);

  @override
  _MainfeaturesDesktopState createState() => _MainfeaturesDesktopState();
}

class _MainfeaturesDesktopState extends State<MainfeaturesDesktop> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(10),
        height: 280,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isHovered ? Colors.white : Colors.transparent,
          gradient: isHovered
              ? LinearGradient(
                  colors: [
                    Colors.pinkAccent.withOpacity(0.2),
                    // Colors.blue.withOpacity(0.2),
                    Colors.blueAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          border: Border.all(
            color: Colors.pinkAccent,
            width: 2,
          ),
          boxShadow: [
            if (isHovered)
              BoxShadow(
                color: Colors.blue.shade800.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  widget.feature.icon,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
              child: Text(
                widget.feature.title,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 15),
              child: Text(
                widget.feature.subtitle,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
