import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => FfavoriteState();
}

class FfavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text("Favorites", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text(
                "No favorites yet",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                "Tap the heart icon to add products to favorites",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
        // : Padding(
        //     padding: EdgeInsets.only(left: 20, right: 10, top: 10),
        //     child: GridView.builder(
        //       itemCount: 2,
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 10,
        //         mainAxisSpacing: 15,
        //         childAspectRatio: 0.7,
        //       ),
        //       itemBuilder: (context, index) {
        //       },
        //     ),
        //   ),
      ),
    );
  }
}
