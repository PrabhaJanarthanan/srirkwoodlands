import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:profinix_app/app/presentationLayer/baseWidgets/base_widgets.dart';
import 'package:profinix_app/website/pages/featurespage/featurespage_content.dart';

class FeaturesPageDesktop extends StatelessWidget {
  const FeaturesPageDesktop({super.key});

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(colors: [
                      Colors.pinkAccent,
                      Colors.blueAccent,
                    ], begin: Alignment.bottomRight, end: Alignment.topRight)
                        .createShader(bounds),
                    child: const Center(
                      child: const Text(
                        "Extensive Features",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 35,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Discover the powerful features that make our platform stand out. "
                    "From seamless integrations to advanced functionalities, our features "
                    "are designed to provide you with the best user experience. "
                    "Whether you're a small business or a large enterprise, our platform scales to meet your needs. "
                    "With a user-friendly interface and cutting-edge technology, we ensure smooth operations. "
                    "Our features empower you to automate processes, boost productivity, and enhance customer engagement. "
                    "Stay ahead of the competition with tools tailored to your success. "
                    "Experience innovation at its finest with our comprehensive suite of solutions.",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                    height: 30), // Increased space between description and list

                // Main Features List
                Expanded(
                  child: ListView.builder(
                    itemCount: mainFeaturesPageContent.length,
                    itemBuilder: (context, index) {
                      final feature = mainFeaturesPageContent[index];
                      bool isEven = index % 2 == 0;

                      return Column(
                        children: [
                          Card(
                            color: Colors.transparent,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (isEven) ...[
                                    // Text Container
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.pinkAccent),
                                        ),
                                        height: 500,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                            colors: [
                                                      Colors.pinkAccent,
                                                      Colors.blueAccent,
                                                    ],
                                                            begin: Alignment
                                                                .bottomRight,
                                                            end: Alignment
                                                                .topRight)
                                                        .createShader(bounds),
                                                child: Center(
                                                  child: Text(
                                                    feature.title,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 35,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Center(
                                              child: Text(
                                                feature.subtitle,
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
                                    ),
                                    const SizedBox(width: 10),
                                    // Image Container
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        height: 500,
                                        child: Image.asset(
                                          feature.icon,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                  ] else ...[
                                    // Image Container
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        height: 500,
                                        child: Image.asset(
                                          feature.icon,
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    // Text Container
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.pinkAccent),
                                        ),
                                        height: 500,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    const LinearGradient(
                                                            colors: [
                                                      Colors.pinkAccent,
                                                      Colors.blueAccent,
                                                    ],
                                                            begin: Alignment
                                                                .bottomRight,
                                                            end: Alignment
                                                                .topRight)
                                                        .createShader(bounds),
                                                child: Center(
                                                  child: Text(
                                                    feature.title,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 35,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Center(
                                              child: Text(
                                                feature.subtitle,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                              height:
                                  30), // Added space between cards for separation
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/'); // Navigate to Home Page
        },
        child: const Icon(Icons.home),
        backgroundColor: Colors.pinkAccent, // Customize as needed
      ),
    );
  }
}
