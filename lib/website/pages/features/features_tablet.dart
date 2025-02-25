import 'package:flutter/material.dart';
import 'package:profinix_app/website/utils/features_contents.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class FeaturesTablet extends StatefulWidget {
  @override
  _FeaturesTabletState createState() => _FeaturesTabletState();
}

class _FeaturesTabletState extends State<FeaturesTablet> {
  late List<bool> isHoveredList;

  @override
  void initState() {
    super.initState();
    isHoveredList = List.filled(featurescontents.length, false);
  }

  void _toggleHover(bool isHovering, int index) {
    setState(() {
      isHoveredList[index] = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    const int itemsPerRow = 2; // Reduced to 2 items per row for tablet layout
    int numberOfRows = (featurescontents.length / itemsPerRow).ceil();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: ProColumn(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                "What We Offer",
                style: TextStyle(
                  fontSize: 40, // Smaller font size for tablet
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 15),
          for (int rowIndex = 0; rowIndex < numberOfRows; rowIndex++)
            ProRow(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = rowIndex * itemsPerRow;
                    i < (rowIndex + 1) * itemsPerRow &&
                        i < featurescontents.length;
                    i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MouseRegion(
                      onEnter: (_) => _toggleHover(true, i),
                      onExit: (_) => _toggleHover(false, i),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        width: 300, // Adjusted width for tablet
                        height: 250, // Adjusted height for tablet
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: isHoveredList[i]
                              ? const LinearGradient(
                                  colors: [
                                    Colors.pinkAccent,
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
                          boxShadow: isHoveredList[i]
                              ? [
                                  BoxShadow(
                                    color: Colors.blueAccent.withOpacity(0.2),
                                    spreadRadius: 4,
                                    blurRadius: 12,
                                    offset: const Offset(0, 0),
                                  ),
                                ]
                              : [],
                        ),
                        child: ProColumn(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 70, // Smaller icon size for tablet
                                height: 70,
                                child: Image.asset(
                                  featurescontents[i]["img"],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            ProColumn(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    featurescontents[i]["title"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20, // Reduced font size
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  featurescontents[i]["description"],
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14, // Reduced font size
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
