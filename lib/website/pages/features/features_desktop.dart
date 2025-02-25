import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:profinix_app/website/utils/features_contents.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FeaturesDesktop extends StatefulWidget {
  @override
  _FeaturesDesktopState createState() => _FeaturesDesktopState();
}

class _FeaturesDesktopState extends State<FeaturesDesktop>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  late List<Animation<Offset>> _slideAnimations;
  late List<bool> _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = List.generate(featurescontents.length, (index) => false);

    _animationControllers = List.generate(
      featurescontents.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      ),
    );

    _slideAnimations = List.generate(featurescontents.length, (index) {
      final offsetDirection = (index % 3 == 0)
          ? const Offset(-1, 0)
          : (index % 3 == 1)
              ? const Offset(0, -1)
              : const Offset(1, 0);

      return Tween<Offset>(
        begin: offsetDirection,
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationControllers[index],
          curve: Curves.easeInOut,
        ),
      );
    });
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onVisibilityChanged(int index, bool visible) {
    if (visible && !_isVisible[index]) {
      setState(() {
        _isVisible[index] = true;
        _animationControllers[index].forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 80) / 3; // Dynamic width adjustment

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Our Signature Creations",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: List.generate(featurescontents.length, (index) {
              return VisibilityDetector(
                key: Key('container-$index'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    _onVisibilityChanged(index, true);
                  }
                },
                child: AnimatedOpacity(
                  opacity: _isVisible[index] ? 1.0 : 0.0,
                  duration: const Duration(seconds: 1),
                  child: SlideTransition(
                    position: _slideAnimations[index],
                    child: Container(
                      width: containerWidth.clamp(300, 350), // Responsive width
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color.fromARGB(255, 233, 156, 13),
                          width: 3,
                        ),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.asset(
                              featurescontents[index]["img"],
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              featurescontents[index]["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            featurescontents[index]["description"],
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          // const SizedBox(height: 40),
        ],
      ),
    );
  }
}
