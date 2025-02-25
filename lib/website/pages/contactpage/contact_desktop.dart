import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/utils/snslinks.dart';
import 'dart:js' as js;
import 'package:profinix_app/website/widgets/basewidgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContactPageDesktop extends StatefulWidget {
  const ContactPageDesktop({Key? key}) : super(key: key);

  @override
  _ContactPageDesktopState createState() => _ContactPageDesktopState();
}

class _ContactPageDesktopState extends State<ContactPageDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideFromLeft;
  late Animation<Offset> _slideFromRight;
  late Animation<double> _fadeIn;
  bool _hasAnimated = false; // Ensures animation runs only once

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideFromLeft = Tween<Offset>(
      begin: const Offset(0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _slideFromRight = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeIn = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('contact-page'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5 && !_hasAnimated) {
          _controller.forward();
          setState(() {
            _hasAnimated = true; // Prevents re-triggering the animation
          });
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isTabletOrSmaller = constraints.maxWidth < 1024;
          final double padding = isTabletOrSmaller ? 16 : 32;
          final double fontSize = isTabletOrSmaller ? 16 : 28;
          final double headingFontSize = isTabletOrSmaller ? 28 : 35;

          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 233, 156, 13),
                        Color.fromARGB(255, 245, 208, 85),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ).createShader(bounds),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: headingFontSize,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Flex(
                    direction:
                        isTabletOrSmaller ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Address Section (Slides from Left)
                      Expanded(
                        child: FadeTransition(
                          opacity: _fadeIn,
                          child: SlideTransition(
                            position: _slideFromLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: isTabletOrSmaller ? 20 : 10),
                                Text(
                                  "Sri RK Woodlands, \n178, Erode Road, \nKrishnapuram, \Kavindapadi, \nErode, \nTamilnadu-638001, \nIndia",
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20, height: 20),
                      // Contact Details Section (Slides from Right)
                      Expanded(
                        child: FadeTransition(
                          opacity: _fadeIn,
                          child: SlideTransition(
                            position: _slideFromRight,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '+91 97912 96517, \n srirkwoodlands@gmail.com',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: Colors.white,
                  ),
                  //const SizedBox(height: 25),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
