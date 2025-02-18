import 'package:admin_web_portal/mainScreens/home_screen.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title; // Changed to non-nullable
  final PreferredSizeWidget? bottom;

  const SimpleAppBar({super.key, required this.title, this.bottom});

  @override
  Size get preferredSize => Size.fromHeight(bottom == null
      ? AppBar().preferredSize.height
      : 80 + AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.pinkAccent],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontFamily: "Signatra"),
      ),
      bottom: bottom, // Adding the bottom property if provided
    );
  }
}
