import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/widgets/navbar/mobile_navbar.dart';

class PricingMobile extends StatefulWidget {
  @override
  _PricingMobileState createState() => _PricingMobileState();
}

class _PricingMobileState extends State<PricingMobile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  void _onNavItemTap(int index) {
    switch (index) {
      case 0:
        _navigateToHome();
        break;
      case 1:
        _navigateToMainfeatures();
        break;
      case 2:
        _navigateToContact();
        break;
    }
  }

  void _navigateToHome() {
    Get.toNamed('/');
  }

  void _navigateToMainfeatures() {
    Get.toNamed('/features');
  }

  void _navigateToContact() {
    Get.toNamed('/contactpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Pricing'),
        backgroundColor: Colors.transparent,
      ),
      drawer: MobileNavBar(
        scrollToContact: _navigateToContact,
        scrollToFeatures: _navigateToMainfeatures,
        scrollToHome: _navigateToHome,
        onNavItemTap: _onNavItemTap,
        //scaffoldKey: _scaffoldKey,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background/frontbg.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '"Experience seamless communication with our affordable and flexible pricing plans!"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Choose the right plan for your business. Whether you need direct agent communication, CRM services, or professional support, we have a flexible pricing model tailored to your needs. Explore the options below!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ..._buildPricingDescriptions(),
                const SizedBox(height: 20),
                _buildImageCarousel(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> get _pricingImages => [
        'assets/pricing/agentdirectcrm.png',
        'assets/pricing/agentdirectbs.png',
        'assets/pricing/customerdirectcrm.png',
        'assets/pricing/customerdirectbs.png',
        'assets/pricing/postservicecrm.png',
        'assets/pricing/proservicebs.png',
        'assets/pricing/agentservicecrm.png',
        'assets/pricing/agentservicebs.png',
      ];

  List<Widget> _buildPricingDescriptions() => [
        const Text(
          "1. *Agent Direct Plans*: Get the flexibility of managing communication directly with agents. Choose between CRM and Business Services based on your specific needs.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "2. *Customer Direct Plans*: Empower your customers to engage with your services directly through CRM or Business Services, designed for a streamlined experience.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "3. *Pro Services*: Unlock advanced features that come with professional services to take your communication to the next level with customized CRM and Business Services.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "4. *Agent Service Plans*: Ideal for agencies that need a comprehensive solution for CRM and Business Services. Your agents can easily manage customer interactions and business needs.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ];

  Widget _buildImageCarousel() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: screenHeight * 0.9, // Increased to 50% of screen height
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: _pricingImages.map((imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0), // Rounded edges
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      width: screenWidth * 1.5,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _pricingImages.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      _currentIndex == entry.key ? Colors.white : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
