import 'package:flutter/material.dart';

import 'package:profinix_app/website/pages/footer/footer_desktop.dart';
import 'package:profinix_app/website/pages/frontpage/front_desktop.dart';

import 'package:profinix_app/website/widgets/navbar/desktop_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../boutique_content/boutique_content.dart';
import '../boutique_description/boutique_desc_desktop.dart';
import '../other_products_video/otherproducts.dart';
import '../shopping/product_listing/product_listing_desktop.dart';

class HomePageDesktop extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey contactKey;
  final GlobalKey featureskey;
  final GlobalKey homekey;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;

  const HomePageDesktop({
    required this.scrollController,
    required this.contactKey,
    required this.featureskey,
    required this.homekey,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    super.key,
  });

  @override
  _HomePageDesktopState createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHomeFabVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true); // Repeats animation (pulse effect)

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels > 100) {
        if (!_isHomeFabVisible) {
          setState(() {
            _isHomeFabVisible = true;
          });
        }
      } else {
        if (_isHomeFabVisible) {
          setState(() {
            _isHomeFabVisible = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  void _openWhatsApp() async {
    final String whatsappNumber = "+919791296517"; // Replace with your number
    final String message = "Hello, I need assistance."; // Customize the message
    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      debugPrint("Could not open WhatsApp.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
            Positioned.fill(
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
              ?'assets/background/srinivibackgrounddark.png'
              : 'assets/background/srinivibackgroundlight.png',
              fit: BoxFit.cover,
            ),
          ),

          
          Column(
            children: [
              // Navigation bar
              Container(
                color: Colors.transparent,
                child: DesktopNavBar(
                  scrollToContact: widget.scrollToContact,
                  scrollToFeatures: widget.scrollToFeatures,
                  scrollToHome: widget.scrollToHome,
                  onNavItemTap: (index) {},
                ),
              ),
              // Main content area
              Expanded(
                child: SingleChildScrollView(
                  controller: widget.scrollController,
                  child: Column(
                    children: [
                      OtherProductsSection(),
                      // FrontDesktop(
                      //   key: widget.homekey,
                      //   scrollToContact: widget.scrollToContact,
                      //   scrollToFeatures: widget.scrollToFeatures,
                      //   scrollToHome: widget.scrollToHome,
                      // ),
                      BoutiqueDescDesktop(),
                      SizedBox(height: 20),
                      ProductListingDesktop(),
                      SizedBox(height: 20),
                      //OtherProductsSection(),
                      // SizedBox(height: 20),
                       SriNiviBoutiqueContent(),
                  
                      const FooterDesktop(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          // Scroll-to-top FAB
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            right: _isHomeFabVisible ? 16 : -90, // Slide-in from the right
            bottom: 100,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _isHomeFabVisible ? 1.0 : 0.0,
              child: RawMaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                onPressed: widget.scrollToHome,
                fillColor: const Color.fromARGB(255, 236, 171, 29),
                child: const Icon(Icons.keyboard_double_arrow_up),
              ),
            ),
          ),
          // WhatsApp FAB
          // Positioned(
          //   right: 10,
          //   bottom: 10,
          //   child: ScaleTransition(
          //     scale: Tween(begin: 1.0, end: 1.2).animate(
          //       CurvedAnimation(
          //         parent: _controller,
          //         curve: Curves.easeInOut,
          //       ),
          //     ),
          //     child: FloatingActionButton(
          //       onPressed: _openWhatsApp,
          //       backgroundColor: Colors.transparent,
          //       child: Image.asset(
          //         'assets/logo/whatsappicon.png',
          //         width: 50,
          //         height: 50,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
