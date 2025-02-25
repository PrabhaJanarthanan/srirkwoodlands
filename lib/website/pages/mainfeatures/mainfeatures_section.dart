import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_contents.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_desktop.dart';
import 'package:profinix_app/website/pages/mainfeatures/mainfeatures_mobile.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';
import 'dart:async';

class MainfeaturesSection extends StatefulWidget {
  const MainfeaturesSection({Key? key}) : super(key: key);

  @override
  _MainfeaturesSectionState createState() => _MainfeaturesSectionState();
}

class _MainfeaturesSectionState extends State<MainfeaturesSection> {
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page == mainFeaturesUtils.length - 1) {
        _pageController.animateToPage(0,
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(
            duration: const Duration(seconds: 1), curve: Curves.easeInOut);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('assets/background/frontpagebg.png'),
          // ),
          ),
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Colors.pinkAccent,
                  Colors.blueAccent,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ).createShader(bounds),
              child: const Text(
                "Extensive Features",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 320, // Adjust height as needed
            width: screenWidth < 600 ? screenWidth - 100 : 600,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                // BoxShadow(
                //   color: Colors.pinkAccent.withOpacity(0.5),
                //   spreadRadius: 5,
                //   offset: Offset(0, 3),
                // ),
              ],
            ),

            child: PageView.builder(
              controller: _pageController,
              itemCount: mainFeaturesUtils.length,
              itemBuilder: (context, index) {
                final feature = mainFeaturesUtils[index];
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  //width: screenWidth < 600 ? screenWidth - 40 : 400,
                  margin: const EdgeInsets.all(10),
                  child: screenWidth < 600
                      ? MainfeaturesMobile(feature: feature)
                      : MainfeaturesDesktop(feature: feature),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {
              Get.toNamed('/features');
            },
            label: const Text(
              "Learn More",
              style: TextStyle(fontSize: 20, color: Colors.pinkAccent),
            ),
            icon: const Icon(
              Icons.arrow_forward,
              color: Colors.blueAccent,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
