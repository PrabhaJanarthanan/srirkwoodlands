import 'package:flutter/material.dart';

import '../video_page/video_page_desktop.dart';

class OtherProductsSection extends StatelessWidget {
  const OtherProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
         
          //const SizedBox(height: 30),
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const [
    AutoPlayVideoCard(
      title: "Bridal Collections",
      
      videoUrl: 'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/silksarees.mp4'

    ),
    AutoPlayVideoCard(
      title: "Salwar Suits",
      videoUrl: 'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/salwarsuits.mp4',
    ),
    AutoPlayVideoCard(
      title: "Daily Wear Sarees",
      videoUrl: 'https://raw.githubusercontent.com/PrabhaJanarthanan/srinivi_videos/main/organzasarees.mp4',
    ),
  ],
),

        ],
      ),
    );
  }
}
