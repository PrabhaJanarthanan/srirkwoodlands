import 'package:flutter/material.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_contents.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class MainfeaturesTablet extends StatefulWidget {
  final MainfeaturesContents feature;

  const MainfeaturesTablet({required this.feature, Key? key}) : super(key: key);

  @override
  _MainfeaturesTabletState createState() => _MainfeaturesTabletState();
}

class _MainfeaturesTabletState extends State<MainfeaturesTablet> {
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
        height: 240, // Adjusted height for tablet
        width: 280, // Adjusted width for tablet
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(20), // Slightly less rounded for tablet
          color: isHovered ? Colors.white : Colors.transparent,
          gradient: isHovered
              ? LinearGradient(
                  colors: [
                    Colors.pinkAccent.withOpacity(0.3), // Slightly more opacity
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
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 60, // Adjusted size for tablet
                width: 60, // Adjusted size for tablet
                child: Image.asset(
                  widget.feature.icon,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(10, 10, 10, 5), // Adjusted padding
              child: Text(
                widget.feature.title,
                style: const TextStyle(
                  fontSize: 22, // Adjusted font size for tablet
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(10, 0, 10, 10), // Adjusted padding
              child: Text(
                widget.feature.subtitle,
                style: const TextStyle(
                  fontSize: 18, // Adjusted font size for tablet
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
