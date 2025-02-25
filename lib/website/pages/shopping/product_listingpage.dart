import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cart_page.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/product_card.dart';

class ProductListingPage extends StatefulWidget {
  @override
  _ProductListingPageState createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final CartController cartController = Get.put(CartController());

  List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "imagePath": "assets/products/lordganesha.png",
      "name": "Handcrafted Lord Ganesha ",
      "price": 3500.0,
      "category": "Statues"
    },
    {
      "id": 2,
      "imagePath": "assets/products/lordmurugaframe.jpg",
      "name": "Lord Muruga Frame",
      "price": 2800.0,
      "category": "Statues"
    },
    {
      "id": 3,
      "imagePath": "assets/products/sofawithoutcushion.png",
      "name": " Teak Sofa",
      "price": 13800.0,
      "category": "Furniture"
    },
    {
      "id": 4,
      "imagePath": "assets/products/blacksofa.png",
      "name": " RoseWood Sofa",
      "price": 16900.0,
      "category": "Furniture"
    },
    {
      "id": 5,
      "imagePath": "assets/products/blackchair.png",
      "name": " Rosewood Side Chair",
      "price": 3500.0,
      "category": "Furniture"
    },
    {
      "id": 6,
      "imagePath": "assets/products/emptychair.png",
      "name": " Teak Side Chair",
      "price": 2800.0,
      "category": "Furniture"
    },
    {
      "id": 7,
      "imagePath": "assets/products/woodchips.jpg",
      "name": "Wood Chips/kg",
      "price": 100.0,
      "category": "Others"
    },
    {
      "id": 8,
      "imagePath": "assets/products/checkeddoor.png",
      "name": "Wooden Door",
      "price": 32000.0,
      "category": "Doors"
    },
    {
      "id": 9,
      "imagePath": "assets/products/templedoor.png",
      "name": "Wooden Divine Door",
      "price": 43500.0,
      "category": "Doors"
    },
    {
      "id": 10,
      "imagePath": "assets/products/flowerdoor.png",
      "name": "Wooden Flower Door",
      "price": 35000.0,
      "category": "Doors"
    },
    {
      "id": 11,
      "imagePath": "assets/products/lordmuruga.png",
      "name": "Handcrafted Lord Muruga",
      "price": 3500.0,
      "category": "Statues"
    },
    {
      "id": 12,
      "imagePath": "assets/products/lordganeshaframe.jpg",
      "name": "Lord Ganesha Frame",
      "price": 2800.0,
      "category": "Statues"
    },
  ];

  String selectedCategory = "All";
  bool sortAscending = true;

  List<Map<String, dynamic>> get filteredProducts {
    List<Map<String, dynamic>> filtered = List.from(products);
    if (selectedCategory != "All") {
      filtered =
          filtered.where((p) => p['category'] == selectedCategory).toList();
    }
    filtered.sort((a, b) => sortAscending
        ? a['price'].compareTo(b['price'])
        : b['price'].compareTo(a['price']));
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/rkbackgroundbrown.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Our Products',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // 🔍 Filter & Sort
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                //spacing: 20,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Category Filter
                  DropdownButton<String>(
                    value: selectedCategory,
                    items: ["All", "Doors", "Statues", "Furniture", "Others"]
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category,
                                  style: TextStyle(color: Colors.white)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value!;
                      });
                    },
                  ),
                  // Sorting
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sortAscending = !sortAscending;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 233, 156, 13),
                    ),
                    child: Text(
                      sortAscending
                          ? 'Price: Low to High'
                          : 'Price: High to Low',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // 🛒 Product Grid
            Expanded(
              child: SingleChildScrollView(
                // padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 10, // Space between items horizontally
                  runSpacing: 10, // Space between items vertically
                  alignment: WrapAlignment.center,
                  children: filteredProducts.map((product) {
                    return IntrinsicWidth(
                      child: IntrinsicHeight(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width > 800
                              ? 250
                              : 160, // Fixed width
                          child: ProductCard(
                            imagePath: product["imagePath"],
                            productName: product["name"],
                            price: product["price"],
                            onAddToCart: () {
                              cartController.addItemToCart({
                                'imagePath': product['imagePath'],
                                'name': product['name'],
                                'price': product['price'],
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => CartPage());
          },
          backgroundColor: Color.fromARGB(255, 233, 156, 13),
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
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
              ],
            );
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
