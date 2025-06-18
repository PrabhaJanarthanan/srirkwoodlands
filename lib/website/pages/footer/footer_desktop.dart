import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/utils/constants/colors.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class FooterDesktop extends StatefulWidget {
  const FooterDesktop({super.key});

  @override
  State<FooterDesktop> createState() => _FooterDesktopState();
}

class _FooterDesktopState extends State<FooterDesktop> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dark = SNHelperFunctions.isDarkMode(context);
    return Stack(
      children: [ 
        Positioned.fill(
        child: Image.asset(
        dark
              ? 'assets/background/footerdark.png'
              : 'assets/background/footerlight.png',
          fit: BoxFit.cover,
        ),
      ),
      
      Container(
        //elevation: 6,
        child: Padding(
          padding:  EdgeInsets.all(SNSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: SNSizes.spaceBtwSections),
      
              // === Contact Info & Socials ===
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // About us
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About Us', style: textTheme.titleMedium),
                      const SizedBox(height: SNSizes.spaceBtwItems),
                      Text('Sri Nivi Boutique', style: textTheme.bodySmall),
                      Text('Fashion with Tradition', style: textTheme.bodySmall),
                      Text('Based in Erode', style: textTheme.bodySmall),
                                  ],
                                ),   
                                    
                    
                    // Our Policies
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Our Policies', style: textTheme.titleMedium),
                        const SizedBox(height: SNSizes.spaceBtwItems),
                        _footerLink('Privacy Policy', '/privacypolicy'),
                        const SizedBox(height: SNSizes.spaceBtwItems / 2),
                        _footerLink('Terms & Conditions', '/termsandconditions'),
                        const SizedBox(height: SNSizes.spaceBtwItems / 2),
                        _footerLink('Refund Policy', '/returnsrefund'),
                      ],
                    ),

                  // Connect With Us
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Connect With Us', style: textTheme.titleMedium),
                        const SizedBox(height: SNSizes.spaceBtwItems),
                        Text('Email: support@srinivi.tech', style: textTheme.bodySmall),
                        Text('Phone: +91 9488501457', style: textTheme.bodySmall),
                        Text('118, Mettur Road, Erode', style: textTheme.bodySmall),
                        const SizedBox(height: SNSizes.spaceBtwItems),
                        Row(
                          children: [
                            _socialIcon(Image.asset(SNImages.facebook,
                                color: dark ? SNColors.white : SNColors.blackContainer), 'https://facebook.com'),
                            const SizedBox(width: SNSizes.spaceBtwItems),
                            _socialIcon(Image.asset(SNImages.instagram,
                                color: dark ? SNColors.white : SNColors.blackContainer), 'https://www.instagram.com'),
                            const SizedBox(width: SNSizes.spaceBtwItems),
                            _socialIcon(Image.asset(SNImages.twitter,
                                color: dark ? SNColors.white : SNColors.blackContainer), 'https://twitter.com'),
                            const SizedBox(width: SNSizes.spaceBtwItems),
                            _socialIcon(Image.asset(SNImages.linkedin,
                                color: dark ? SNColors.white : SNColors.blackContainer), 'https://linkedin.com'),
                          ],
                        )
                      ],
                    ),
                  ],

              ),
                  
            const SizedBox(height: SNSizes.spaceBtwSections),
            Text(
              '© 2025 Sri Nivi Boutique - All rights reserved.',
              style: textTheme.bodySmall,
            ),

                        ],
                    ),
                    ),
                  ),
                  ],
                  );

                
              }

  Widget _footerLink(String text, String route) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Get.toNamed(route),
        child: Text(text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  decoration: TextDecoration.underline,
                )),
      ),
    );
  }

  Widget _socialIcon(Widget iconWidget, String url,
      {double size = SNSizes.iconMd}) {
    return InkWell(
      onTap: () => launchUrl(Uri.parse(url)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(width: size, height: size, child: iconWidget),
      ),
    );
  }
}
