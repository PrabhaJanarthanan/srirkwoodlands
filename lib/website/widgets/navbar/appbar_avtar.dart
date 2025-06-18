import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:profinix_app/website/controller/auth_controller.dart';

class AppbarAvtar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Sri Nivi Boutique"),
      centerTitle: true, // Ensures the title is centered on all devices
      actions: [
        Obx(() {
          var user = AuthController.instance.user.value;
          return user != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    backgroundImage: user.photoURL != null
                        ? CachedNetworkImageProvider(user.photoURL!)
                        : null,
                    child: user.photoURL == null
                        ? const Icon(Icons.person,
                            size: 20, color: Colors.black)
                        : null,
                    radius: 18,
                  ),
                )
              : TextButton(
                  onPressed: () async {
                    bool isLoggedIn =
                        await AuthController.instance.signInWithGoogle();
                    if (isLoggedIn) {
                      Get.snackbar("Login Success", "You are now logged in!",
                          backgroundColor: Colors.green,
                          colorText: Colors.white);
                    }
                  },
                  child: const Text("Login"),
                );
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
