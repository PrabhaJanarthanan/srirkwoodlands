import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/collections/bridal/bridal_collections_desktop.dart';
import 'package:profinix_app/website/pages/collections/bridal/bridal_collections_mobile.dart';
import 'package:profinix_app/website/pages/contactpage/contactpagedesktop.dart';
import 'package:profinix_app/website/pages/contactpage/pricing_contact_page.dart';
import 'package:profinix_app/website/pages/featurespage/featurespage.dart';
import 'package:profinix_app/website/pages/frontpage/front_mobile.dart';
import 'package:profinix_app/website/pages/loginpage/login_desktop.dart';
import 'package:profinix_app/website/pages/loginpage/signup_desktop.dart';
import 'package:profinix_app/website/pages/refundpolicy/refund.dart';
import 'package:profinix_app/website/pages/shippinganddelivery/shipping_desktop.dart';
import 'package:profinix_app/website/pages/shopping/product_listing/product_listing.dart';
import 'package:profinix_app/website/pages/shopping/product_listing/product_listing_mobile.dart';
import 'package:profinix_app/website/pages/shopping/product_listing/product_listing_desktop.dart';
import '../pages/shopping/cart/wishlist.dart';
import 'routes_exporter.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

final List<GetPage> webroutes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/signUp', page: () => SignupDesktop()),
  GetPage(
      name: '/navbar',
      page: () => NavBar(
            scrollToContact: () {},
            scrollToFeatures: () {},
            scrollToHome: () {},
            onNavItemTap: (int index) {},
            scaffoldKey: _scaffoldKey,
          )),

  GetPage(name: '/page1', page: () => Page1()),
  
  GetPage(name: '/contactpage', page: () => ContactPage()),
  GetPage(name: '/contactUs', page: () => ContactUs()),
  GetPage(name: '/footer', page: () => Footer()),
  GetPage(name: '/shopping', page: () => ProductListing()),

  //widgets
  GetPage(
      name: '/frontdesktop',
      page: () => FrontDesktop(
            scrollToContact: () {},
            scrollToFeatures: () {},
            scrollToHome: () {},
          )),
  GetPage(
      name: '/frontmobile',
      page: () => FrontMobile(
            scrollToContact: () {},
            scrollToFeatures: () {},
            scrollToHome: () {},
            // onNavItemTap: (index) {},
            // scaffoldKey: _scaffoldKey,
          )),
  // GetPage(name: '/page1tablet', page: () => const FrontTablet()),
 
 
  GetPage(name: '/contactdesktop', page: () => const ContactPageDesktop()),
  GetPage(name: '/contactmobile', page: () => const ContactPageMobile()),
  GetPage(name: '/contactdesktop', page: () => const ContactPageTablet()),
  GetPage(name: '/footerdesktop', page: () => const FooterDesktop()),
  GetPage(name: '/footermobile', page: () => const FooterMobile()),
  GetPage(name: '/footertablet', page: () => const FooterTablet()),

//pricing

   GetPage(name: '/shoppingdesktop', page: () => ProductListingDesktop()),
   GetPage(name: '/shoppingmobile', page: () => ProductListingMobile()),

   //Wislist
  GetPage(name: '/wishlist', page: () => WishlistScreen()),
  GetPage(name: '/features', page: () => FeaturesPage()),
  //about pages
  GetPage(name: '/termsandconditions', page: () => TermsandConditions()),
  GetPage(name: '/privacypolicy', page: () => PrivacyPolicy()),
  GetPage(name: '/returnsandrefund', page: () => RefundPage()),
  GetPage(name: '/pricingcontactpage', page: () => const PricingContactPage()),
  GetPage(name: '/shippinganddelivery', page: () => ShippingDesktop()),

  //Collections
    GetPage(name: '/bridalCollections', page: () => const BridalCollectionsDesktop()),
    GetPage(name: '/bridalCollectionsmobile', page: () => const BridalCollectionsMobile(),
    ),
];
