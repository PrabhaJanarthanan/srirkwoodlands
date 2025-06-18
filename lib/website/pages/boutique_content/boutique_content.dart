import 'package:flutter/material.dart';

class SriNiviBoutiqueContent extends StatelessWidget {
  const SriNiviBoutiqueContent({super.key});

  @override
  Widget build(BuildContext context) {
  

    return SingleChildScrollView(
     // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('🌸 Sri Nivi Boutique – Where Tradition Meets Trend', 
              style: Theme.of(context).textTheme.headlineLarge),
            ),
            const SizedBox(height: 16),
            Text(
              'Discover a world of elegance at Sri Nivi Boutique, your go-to destination for premium sarees, lehengas, and salwars. Whether you’re celebrating a festival, attending a wedding, or looking for everyday ethnic charm, our curated collections offer something for every occasion and every woman.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
        
            Text('✨ Shop Cotton Sarees', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Comfort, grace, and timeless charm.\nWrap yourself in breathable elegance with our handpicked cotton sarees. Perfect for daily wear, temple visits, or casual outings, these sarees combine lightweight comfort with classic beauty. Available in a delightful range of colors, prints, and weaves, our cotton collection is loved for its simplicity and versatility.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
        
            Text('🌟 Shop Designer Sarees', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Be the showstopper, effortlessly.\nTurn heads at every event with our designer saree collection, crafted for those who love ethnic fashion with a modern twist. From rich embroidery to fusion fabrics and bold palettes, each piece reflects the art of celebration.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
        
            Text('💫 Shop Art Silk & Fancy Sarees', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Shimmer and shine, without compromise.\nLove the richness of silk but need something lightweight and travel-friendly? Our art silk and fancy sarees offer the perfect balance between affordability and glamour. With stunning borders, vibrant colors, and trendy motifs, these sarees are great for long events or as a thoughtful gift.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
        
            Text('👑 Shop Semi Banarasi Sarees', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Timeless weaves with a contemporary soul.\nExperience the elegance of Banarasi-inspired artistry in our exquisite semi-Banarasi sarees. Designed to bring traditional motifs and subtle zari work into your everyday wear, these sarees are perfect for temple visits, family functions, and festive gatherings.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 20),
        
            Text('🛍️ Explore. Adore. Wear it with pride.', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              'Shop now at Sri Nivi Boutique and let your style speak for itself—whether it’s with a delicate cotton saree, a dazzling designer drape, a vibrant lehenga, or an elegant salwar suit.',
             style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
