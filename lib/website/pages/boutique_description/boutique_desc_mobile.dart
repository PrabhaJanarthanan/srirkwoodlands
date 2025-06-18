import 'package:flutter/material.dart';
import '../../utils/helpers/helper_functions.dart';

class BoutiqueDescMobile extends StatefulWidget {
  const BoutiqueDescMobile({super.key});

  @override
  State<BoutiqueDescMobile> createState() => _BoutiqueDescMobileState();
}

class _BoutiqueDescMobileState extends State<BoutiqueDescMobile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    
    String fullText = '''
Unfold Elegance, Define Your Style: Sri Nivi Boutique Collection

At Sri Nivi Boutique, each piece is more than just fashion—it's a story, a statement, a legacy. Whether it’s a glamorous bridal saree, a chic lehenga, or a timeless salwar suit, our collections are curated for women who celebrate tradition while embracing modern style.

Sarees That Speak Grace & Glamour
From the shimmering beauty of soft silk sarees to the breezy charm of cotton and linen drapes, and from the rich artistry of Banarasi to bold art silk creations, every saree in our collection is designed to elevate your elegance. Whether you’re dressing for your big day, a festive occasion, or just a stylish everyday, our sarees blend heritage with trend effortlessly.

Bridal & Wedding Collection: Make Your Moment Magical
Every bride dreams of the perfect outfit—and we make that dream come true. Our bridal sarees and lehengas are crafted with intricate detailing, luxurious fabrics, and unmatched craftsmanship. From zari borders to hand embroidery, each design is made to make you shine on your special day.

Salwar Suits with a Twist
Modern cuts meet traditional silhouettes in our designer salwar suits. Whether you love bold prints, minimal elegance, or festive flair, our salwar range is perfect for both daily wear and special gatherings.

Why Choose Sri Nivi Boutique?
- Exclusively Handpicked: Each piece is chosen for its quality, style, and individuality.
- Tradition Meets Trend: We blend age-old craftsmanship with modern designs.
- Affordable Luxury: Premium fashion that doesn’t compromise on comfort or budget.
- Tailored for You: From ready-to-wear to custom options, we ensure the perfect fit and finish.

For Every Woman, Every Occasion
Whether you're a bride-to-be, a fashion-forward professional, a festive fashionista, or someone who simply loves beautiful clothes—Sri Nivi Boutique has something crafted just for you.

Drape Your Dreams in Style
Shop trending sarees, elegant lehengas, or versatile salwar suits at Sri Nivi Boutique—where every fold, pleat, and thread celebrates you.
''';

    String shortText = fullText.substring(0, 300) + "...";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isExpanded ? fullText : shortText,
            textAlign: TextAlign.justify,
           style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Text(
              _isExpanded ? 'Show Less ▲' : 'Show More ▼',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: dark ? Colors.amber : Colors.amber
              )
            ),
          ),
        ],
      ),
    );
  }
}
