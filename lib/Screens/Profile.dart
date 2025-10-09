import 'package:best_e_commerce/Screens/Language_Page.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileData = [
      {
        "title": S.of(context).fullName,
        "name": "Mohammad Abu-Alhayja'a",
        "icon": Icons.person,
      },
      {
        "title": S.of(context).email,
        "name": "mohammad@email.com",
        "icon": Icons.email,
      },
      {
        "title": S.of(context).phoneNumber,
        "name": "+962 79 123 4567",
        "icon": Icons.phone,
      },
    ];

    final List<Map<String, dynamic>> accountSettingsData = [
      {
        "title": S.of(context).notificationSettings,
        "icon": Icons.notifications,
      },
      {"title": S.of(context).privacyPolicy, "icon": Icons.privacy_tip},
      {"title": S.of(context).security, "icon": Icons.security},
      {
        "title": S.of(context).language,
        "icon": Icons.language,
        "page": LanguagePage(),
      },
      {"title": S.of(context).helpSupport, "icon": Icons.help},
      {"title": S.of(context).aboutUs, "icon": Icons.info},
      {"title": S.of(context).termsOfService, "icon": Icons.description},
      {"title": S.of(context).logout, "icon": Icons.logout},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).myProfile,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
              width: 412,
              decoration: BoxDecoration(
                color: Color(0XFFff7643),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                      "assets/images/Profile Image.png",
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "john.doe@gmail.com",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),

            ...profileData
                .map(
                  (item) => profileSitting(
                    name: item["name"]!,
                    title: item["title"]!,
                    icon: item["icon"]!,
                  ),
                )
                .toList(),

            SizedBox(height: 30),

            Text(
              S.of(context).accountSettings,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 30),

            ...accountSettingsData
                .map(
                  (item) => accountSettings(
                    context: context,
                    title: item["title"],
                    icon: item["icon"],
                    page: item["page"],
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

Widget profileSitting({
  required String name,
  required String title,
  required IconData icon,
}) {
  return Column(
    children: [
      SizedBox(height: 20),
      Container(
        width: 350,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon box
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Color(0XFFff7643),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white),
              ),

              SizedBox(width: 12),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget accountSettings({
  required BuildContext context,
  required String title,
  required IconData icon,
  Widget? page,
}) {
  return Column(
    children: [
      Container(
        width: 392,
        height: 60,
        decoration: BoxDecoration(),
        child: InkWell(
          onTap: () {
            if (page != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            }
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 50,
                  height: 50,
                  child: Icon(icon, color: Color(0XFFff7643)),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16),
              SizedBox(width: 30),
            ],
          ),
        ),
      ),
      SizedBox(height: 20),
    ],
  );
}
