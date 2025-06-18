import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/utils/constants/sizes.dart';
import 'package:profinix_app/website/utils/helpers/helper_functions.dart';

import '../../../controller/wishlist_controller.dart';
import '../../../utils/constants/colors.dart';

class ProductListingMobile extends StatefulWidget {
  const ProductListingMobile({super.key});

  @override
  State<ProductListingMobile> createState() => _ProductListingMobileState();
}

class _ProductListingMobileState extends State<ProductListingMobile> {
  final CartController cartController = Get.put(CartController());
   final wishlistController = Get.find<WishlistController>();
     final List<String> sortOptions = [
    "All",
  "Price, Low to High",
  "Price, High to Low",
  "Best Selling",
  "Oldest",
];

String selectedSortOption = "All"; // default
  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "imagePath": "assets/products/common1.png",
      "name": "Cotton Saree",
      "price": 1500.0,
      "category": "Saree"
    },
    {
      "id": 2,
      "imagePath": "assets/products/common2.png",
      "name": "Cotton Daily wear",
      "price": 1200.0,
      "category": "Saree"
    },
    {
      "id": 3,
      "imagePath": "assets/products/common3.png",
      "name": "Jute Saree",
      "price": 800.0,
      "category": "Saree"
    },
    {
      "id": 4,
      "imagePath": "assets/products/common4.png",
      "name": "Linen Cotton",
      "price": 950.0,
      "category": "Saree"
    },
    {
      "id": 5,
      "imagePath": "assets/products/common5.jpg",
      "name": "Cotton Saree",
      "price": 2800.0,
      "category": "Saree"
    },
     {
      "id": 6,
      "imagePath": "assets/products/common6.png",
      "name": "Cotton Saree",
      "price": 990.0,
      "category": "Saree"
    },
     {
      "id": 7,
      "imagePath": "assets/products/common7.png",
      "name": "Cotton Saree",
      "price": 900.0,
      "category": "Saree"
    },
     {
      "id": 8,
      "imagePath": "assets/products/common8.png",
      "name": "Cotton Saree",
      "price": 1300.0,
      "category": "Saree"
    },
     {
      "id": 9,
      "imagePath": "assets/products/common9.png",
      "name": "Cotton Saree",
      "price": 2500.0,
      "category": "Saree"
    },
     {
      "id": 10,
      "imagePath": "assets/products/common10.png",
      "name": "Cotton Saree",
      "price": 1200.0,
      "category": "Saree"
    },
  ];
  int currentPage = 0;
  int itemsPerPage = 10; 
  String selectedCategory = "All";
  bool sortAscending = true;
  String sortOption = "Price, Low to High";

  List<Map<String, dynamic>> get filteredProducts {
  List<Map<String, dynamic>> sorted = List.from(products);

  switch (selectedSortOption) {
    case "Price, Low to High":
      sorted.sort((a, b) => a['price'].compareTo(b['price']));
      break;
    case "Price, High to Low":
      sorted.sort((a, b) => b['price'].compareTo(a['price']));
      break;
    case "Best Selling":
      // Add your logic for best-selling (e.g., based on quantity sold)
      break;
    case "Oldest":
      // Add your logic if you have a date field
      break;
  }
  int start = currentPage * itemsPerPage;
  int end = start + itemsPerPage;
  return sorted.sublist(start, end > sorted.length ? sorted.length : end);
}

  final Set<int> wishlistedProductIds = {}; // 🔁 holds IDs of wishlisted products

  void toggleWishlist(int productId) {
    setState(() {
      if (wishlistedProductIds.contains(productId)) {
        wishlistedProductIds.remove(productId);
      } else {
        wishlistedProductIds.add(productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SNHelperFunctions.isDarkMode(context);
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
          'Saree Collections',
          style: Theme.of(context).textTheme.headlineSmall,
                ),
        ),

       // Filter buttons and dropdown
      Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sort By :"),
              SizedBox(width: 20),
          
            DropdownButton<String>(
            value: selectedSortOption,
            items: sortOptions.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSortOption = value!;
                currentPage = 0; // Reset to first page on sort change
              });
            },
          icon: const Icon(Icons.sort),
            ),

          ],
        ),

      ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              final isWishlisted = wishlistedProductIds.contains(product["id"]);
        
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product["imagePath"],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () => toggleWishlist(product["id"]),
                              child: Icon(
                                size: SNSizes.iconMd,
                                isWishlisted
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              product["name"],
                              style: Theme.of(context).textTheme.labelLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                       
                            },
                            icon:  Icon(Icons.shopping_cart_outlined,
                            color: dark? SNColors.primaryColor : SNColors.black),
                            iconSize: SNSizes.iconMd,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        "₹${product["price"]}",
                        style:Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
