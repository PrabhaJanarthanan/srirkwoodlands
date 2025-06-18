import 'package:get/get.dart';

class WishlistController extends GetxController {
  final RxList<Map<String, dynamic>> wishlistItems = <Map<String, dynamic>>[].obs;

  bool isInWishlist(String productId) {
    return wishlistItems.any((item) => item['id'] == productId);
    
  }
  

  void addToWishlist(Map<String, dynamic> product) {
    if (!isInWishlist(product['id'])) {
      wishlistItems.add(product);
    }
  }

  void removeFromWishlist(String productId) {
    wishlistItems.removeWhere((item) => item['id'] == productId);
  }
}
