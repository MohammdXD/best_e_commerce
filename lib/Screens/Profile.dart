import 'package:best_e_commerce/Screens/Language_Page.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 Fetch Firestore user data
  Future<Map<String, dynamic>?> _getUserData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final doc = await _firestore.collection('usersData').doc(uid).get();

    if (doc.exists) {
      return doc.data();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          S.of(context).myProfile,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No user data found"));
          }

          final userData = snapshot.data!;
          final user = _auth.currentUser;

          // 🔹 Combine Firestore data + Auth data
          final List<Map<String, dynamic>> profileData = [
            {
              "title": S.of(context).fullName,
              "name":
                  "${userData['firstName'] ?? ''} ${userData['lastName'] ?? ''}",
              "icon": Icons.person,
            },
            {
              "title": S.of(context).email,
              "name": userData['email'] ?? user?.email ?? "No email",
              "icon": Icons.email,
            },
            {
              "title": S.of(context).phoneNumber,
              "name":
                  userData['phoneNumber'] ?? user?.phoneNumber ?? "No phone",
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
              "page": const LanguagePage(),
            },
            {"title": S.of(context).helpSupport, "icon": Icons.help},
            {"title": S.of(context).aboutUs, "icon": Icons.info},
            {"title": S.of(context).termsOfService, "icon": Icons.description},
            {"title": S.of(context).logout, "icon": Icons.logout},
          ];

          return SingleChildScrollView(
            child: Column(
              children: [
                // 🔹 Profile header
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0XFFff7643),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/Profile Image.png",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${userData['firstName']} ${userData['lastName']}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        userData['email'] ?? user?.email ?? "No email",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                // 🔹 Profile info
                ...profileData.map(
                  (item) => profileSitting(
                    name: item["name"] ?? "",
                    title: item["title"] ?? "",
                    icon: item["icon"] ?? Icons.error,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Section title
                Text(
                  S.of(context).accountSettings,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Account settings
                ...accountSettingsData.map(
                  (item) => accountSettings(
                    context: context,
                    title: item["title"],
                    icon: item["icon"],
                    page: item["page"],
                  ),
                ),
              ],
            ),
          );
        },
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
      const SizedBox(height: 20),
      Container(
        width: 350,
        height: 75,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: const Color(0XFFff7643),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    name,
                    style: const TextStyle(
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
        decoration: const BoxDecoration(),
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
                  child: Icon(icon, color: const Color(0XFFff7643)),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}
