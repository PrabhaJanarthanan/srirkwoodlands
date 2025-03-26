import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:profinix_app/website/pages/shopping/cart/cart_page_desktop.dart';
import 'package:profinix_app/website/pages/shopping/cartcontroller.dart';
import 'package:profinix_app/website/pages/shopping/product_card.dart';

import '../../../controller/auth_controller.dart';

class ProductListingDesktop extends StatefulWidget {
  @override
  _ProductListingDesktopState createState() => _ProductListingDesktopState();
}

class _ProductListingDesktopState extends State<ProductListingDesktop> {
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
           iconTheme: const IconThemeData(color: Colors.white), 
           actions: [
          
    IconButton(
      icon: const Icon(Icons.home, color: Colors.white),
      onPressed: () {
        Get.toNamed('/home'); 
      },
    ),
    
    Obx(() {
      final user = AuthController.instance.user.value;
      return user != null
          ? Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  // Logout confirmation
                  Get.defaultDialog(
                    title: "Logout",
                    middleText: "Are you sure you want to logout?",
                    textConfirm: "Logout",
                    textCancel: "Cancel",
                    confirmTextColor: Colors.white,
                    buttonColor: Colors.red,
                    onConfirm: () {
                      AuthController.instance.signOut();
                      Get.back(); // Close dialog
                    },
                  );
                },
                child: CircleAvatar(
                     backgroundImage: user.photoURL != null
                      ? NetworkImage(user.photoURL!)
                      : null, // Display user photo if available
                  child: user.photoURL == null
                      ? Icon(Icons.person, size: 20, color: Colors.white)
                      : null, // Default icon if no photo

                ),
              ),
            )
          : IconButton(
              icon: Icon(Icons.login_sharp, color: Colors.white),
              onPressed: () async {
                bool isLoggedIn = await AuthController.instance.signInWithGoogle();
                if (isLoggedIn) {
                  Get.snackbar("Success", "Logged in successfully!",
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                       duration: Duration(seconds: 2),
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
            );
    }),
  ],
           
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      cardTheme: CardTheme(
                        color: Color.fromARGB(255, 233, 156, 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35)
                        ),
                      )
                    ),
                    child: DropdownButton<String>(
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
                      icon: const Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.grey,
                       dropdownColor: const Color.fromARGB(255, 34, 15, 11), 
                      
                    ),
                  ),
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
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10, 
                  runSpacing: 10, 
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
        floatingActionButton: Stack(
          children: [
          
          
        Positioned(
          right: 10,
          bottom: 10,
          
          child:  FloatingActionButton(
          onPressed: () {
            Get.to(() => CartPageDesktop());
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
        ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
