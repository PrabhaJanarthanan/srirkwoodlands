import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cart/cart_page_desktop.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/product_card.dart';


class ProductListingDesktop extends StatefulWidget {
  @override
  _ProductListingDesktopState createState() => _ProductListingDesktopState();
}

class _ProductListingDesktopState extends State<ProductListingDesktop> {
  final CartController cartController = Get.put(CartController());
  final List<String> sortOptions = [
    "All",
  "Price, Low to High",
  "Price, High to Low",
  "Best Selling",
  "Oldest",
];

String selectedSortOption = "All"; // default


  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "imagePath": "assets/products/common1.png",
      "name": "Cotton Saree", 
      "price": 999.0,
      "category": "Saree"
    },
       {
      "id": 2,
      "imagePath": "assets/products/common2.png",
      "name": "Cotton Saree",
      "price": 1500.0,
      "category": "Saree"
    },
     {
      "id": 3,
      "imagePath": "assets/products/common3.png",
      "name": "Cotton Saree",
      "price": 1600.0,
      "category": "Saree"
    },
     {
      "id": 4,
      "imagePath": "assets/products/common4.png",
      "name": "Cotton Saree",
      "price": 2200.0,
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


  int get totalPages => (products.length / itemsPerPage).ceil();

  @override
  Widget build(BuildContext context) {
     return Container(
  padding: const EdgeInsets.all(20),
 
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Text(
        'Saree Collections',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      const SizedBox(height: 20),

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

      // Product list
      Wrap(
        spacing: 10,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: filteredProducts.map((product) {
          return SizedBox(
            width: MediaQuery.of(context).size.width > 800 ? 250 : 160,
            child: ProductCard(
              imagePath: product["imagePath"],
              productName: product["name"],
              productId: product["id"].toString(),
              price: product["price"],
              onAddToCart: () {
                cartController.addItemToCart({
                  'imagePath': product['imagePath'],
                  'name': product['name'],
                  'price': product['price'],
                });
              },
            ),
          );
        }).toList(),
      ),

      const SizedBox(height: 20),

      //Pagination
      Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: currentPage>0
              ? () {
                setState(() {
                  currentPage--;
                });
              }
              : null,
              child:  Text('Previous',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: currentPage > 0 ? Colors.black : Colors.grey,
              )),
            ),
            Text(' ${currentPage + 1} of $totalPages',
            style: Theme.of(context).textTheme.labelMedium),
            TextButton(
              onPressed: (currentPage < totalPages - 1)
              ? () {
                setState(() {
                  currentPage++;
                });
              }
              : null,
              child: Text('Next',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: currentPage < totalPages - 1 ? Colors.black : Colors.grey,
              )),
            ),
          ],
        ),
      ),
       const SizedBox(height: 20),
      // View Cart Button
      Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 233, 156, 13),
          onPressed: () => Get.to(() => CartPageDesktop()),
          child: Obx(() {
            return Stack(
              children: [
                const Icon(Icons.shopping_cart, color: Colors.white),
                if (cartController.cartItemCount > 0)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Text(
                        cartController.cartItemCount.toString(),
                        style: const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  )
              ],
            );
          }),
        ),
      ),
    ],
  ),
);
 }
}
