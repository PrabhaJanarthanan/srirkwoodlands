import 'package:flutter/material.dart';

import '../video_page/video_page_mobile.dart'; // Assuming this has AutoPlayVideoCard

class OtherProductsSectionMobile extends StatelessWidget {
  const OtherProductsSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          AutoPlayVideoCardMobile(
            title: "Bridal Collections",
            videoUrl:
                'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/silksarees.mp4',
          ),
          // SizedBox(height: 24),

          // AutoPlayVideoCard(
          //   title: "Salwar Suits",
          //   videoUrl:
          //       'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/salwarsuits.mp4',
          // ),
          // SizedBox(height: 24),

          // AutoPlayVideoCard(
          //   title: "Daily Wear Sarees",
          //   videoUrl:
          //       'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/organzasarees.mp4',
          // ),
        ],
      ),
    );
  }
}
