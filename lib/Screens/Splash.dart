import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:best_e_commerce/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Splash_Scrren extends StatefulWidget {
  const Splash_Scrren({super.key});

  @override
  State<Splash_Scrren> createState() => _Splash_ScrrenState();
}

class _Splash_ScrrenState extends State<Splash_Scrren> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isArabic;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  "EN",
                  style: TextStyle(
                    color: isArabic ? Colors.grey : Color(0xfffb7a43),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Switch(
                  value: isArabic,
                  onChanged: (value) {
                    languageProvider.toggleLanguage();
                  },
                  activeColor: Color(0xfffb7a43),
                  inactiveTrackColor: Colors.deepOrange.shade100,
                  inactiveThumbColor: Color(0xfffb7a43),
                  thumbIcon: MaterialStateProperty.all(
                    Icon(Icons.language, color: Colors.white),
                  ),
                ),
                Text(
                  "AR",
                  style: TextStyle(
                    color: isArabic ? Color(0xfffb7a43) : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                S.of(context).splashTitle,
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xfffb7a43),
                ),
              ),
              SizedBox(height: 10),
              Text(
                S.of(context).welcomeMessage,
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
                  child: Text(
                    S.of(context).Continue,
                    style: TextStyle(fontSize: 18),
                  ),
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
