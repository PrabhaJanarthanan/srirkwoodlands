import 'package:flutter/material.dart';
import 'package:profinix_app/app/presentationLayer/baseWidgets/base_widgets.dart';
import 'package:profinix_app/website/pages/featurespage/featurespage_content.dart';

class FeaturesPageMobile extends StatelessWidget {
  const FeaturesPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background/featuresbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0), // Adjusted padding for mobile
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(colors: [
                        Colors.pinkAccent,
                        Colors.blueAccent,
                      ], begin: Alignment.bottomRight, end: Alignment.topRight)
                          .createShader(bounds),
                      child: const Center(
                        child: Text(
                          "Extensive Features",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 28, // Adjusted font size for mobile
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Discover our platform's key features that enhance user experience. "
                      "From easy integrations to advanced tools, we cater to businesses of all sizes. "
                      "Our user-friendly interface and innovative technology help streamline your operations. "
                      "Boost productivity, automate processes, and engage customers effectively. "
                      "Stay competitive with our tailored solutions.",
                      style: TextStyle(
                          fontSize: 16, // Adjusted font size for mobile
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Main Features List
                  ListView.builder(
                    physics:
                        const NeverScrollableScrollPhysics(), // Prevent scrolling conflict with the main column
                    shrinkWrap: true,
                    itemCount: mainFeaturesPageContent.length,
                    itemBuilder: (context, index) {
                      final feature = mainFeaturesPageContent[index];
                      return Card(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              16.0), // Adjusted padding for mobile
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                            colors: [
                                      Colors.pinkAccent,
                                      Colors.blueAccent,
                                    ],
                                            begin: Alignment.bottomRight,
                                            end: Alignment.topRight)
                                        .createShader(bounds),
                                child: Center(
                                  child: Text(
                                    feature.title,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize:
                                            24, // Adjusted font size for mobile
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Center(
                                child: Image.asset(
                                  feature.icon,
                                  fit: BoxFit.cover,
                                  height: 80, // Adjusted image size for mobile
                                  width: 80,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      10), // Space between the image and subtitle
                              Center(
                                child: Text(
                                  feature.subtitle,
                                  style: const TextStyle(
                                    fontSize:
                                        14, // Adjusted font size for mobile
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
