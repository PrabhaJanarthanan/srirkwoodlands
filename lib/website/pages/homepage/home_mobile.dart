import 'package:flutter/material.dart';

import 'package:profinix_app/website/pages/frontpage/front_mobile.dart';


import 'package:profinix_app/website/utils/constants.dart';
import 'package:profinix_app/website/widgets/navbar/drawer_mobile.dart';
import 'package:profinix_app/website/widgets/navbar/mobile_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../boutique_description/boutique_desc_mobile.dart';
import '../footer/footer_mobile.dart';
import '../other_products_video/otherproducts_mobile.dart';
import '../shopping/product_listing/product_listing_mobile.dart';

class HomePagePhone extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey contactKey;
  final GlobalKey featureskey;
  final GlobalKey homekey;
  final VoidCallback scrollToContact;
  final VoidCallback scrollToFeatures;
  final VoidCallback scrollToHome;
  final Function(int) onNavItemTap;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePagePhone({
    required this.scrollController,
    required this.contactKey,
    required this.featureskey,
    required this.homekey,
    required this.scrollToContact,
    required this.scrollToFeatures,
    required this.scrollToHome,
    required this.onNavItemTap,
    Key? key,
  }) : super(key: key);

  void handleNavItemTap(int index) {
    switch (index) {
      case 0:
        scrollToHome();
        break;
      case 1:
        scrollToFeatures();
        break;
      case 2:
        scrollToContact();
        break;
      default:
        break;
    }
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
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMobile(
        onNavItemTap: handleNavItemTap,
      ),
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
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                MobileNavBar(
                  scrollToContact: scrollToContact,
                  scrollToFeatures: scrollToFeatures,
                  scrollToHome: scrollToHome,
                  onNavItemTap: onNavItemTap,
                 // scaffoldKey: _scaffoldKey,
                ),
                OtherProductsSectionMobile(),
                FrontMobile(
                  key: homekey,
                  scrollToContact: scrollToContact,
                  scrollToFeatures: scrollToFeatures,
                  scrollToHome: scrollToHome,
                  // onNavItemTap: (index) {},
                  // scaffoldKey: _scaffoldKey,
                ),
                BoutiqueDescMobile(),
                SizedBox(height: 20),
               ProductListingMobile(),
                //MainfeaturesSection(key: featureskey),
                //ContactPageMobile(key: contactKey),
                const FooterMobile(),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   crossAxisAlignment: CrossAxisAlignment.end,
      //   children: [
      //     const SizedBox(height: 10),
      //     RawMaterialButton(
            // onPressed: () {
            //   scrollToHome();
            // },
            // shape: const RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(20),
            //     //bottomLeft: Radius.circular(20),
            //   ),
            // ),
            // child: const Icon(
            //   Icons.arrow_drop_up,
            //   size: 50,
            //   color: Color.fromARGB(255, 233, 156, 13),
            // ),
            // backgroundColor: Colors.pinkAccent,
      //     ),
      //     RawMaterialButton(
      //       onPressed: _openWhatsApp,
      //       elevation: 2.0,
      //       fillColor: Colors.transparent,
      //       shape: const CircleBorder(),
      //       child: Image.asset(
      //         'assets/logo/whatsappicon.png',
      //         width: 40,
      //         height: 40,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
