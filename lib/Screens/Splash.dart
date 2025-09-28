import 'package:best_e_commerce/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Splash_Scrren extends StatefulWidget {
  const Splash_Scrren({super.key});

  @override
  State<Splash_Scrren> createState() => Splash_ScrrenState();
}

class Splash_ScrrenState extends State<Splash_Scrren> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "TOKOTO",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffb7a43),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome to Tokoto, Let's shop!",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 100),

              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  enableInfiniteScroll: false,
                  pauseAutoPlayOnManualNavigate: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: [
                  Image.asset(
                    'assets/images/splash_1.png',
                    width: 250,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/splash_2.png',
                    width: 230,
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/splash_3.png',
                    width: 250,
                    height: 300,
                  ),
                ],
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 20 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentIndex == index
                          ? Color(0xfffb7a43)
                          : Colors.grey,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 200),
              SizedBox(
                height: 50,
                width: 350,

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: Text("Continue", style: TextStyle(fontSize: 18)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffb7a43),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
