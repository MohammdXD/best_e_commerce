import 'package:best_e_commerce/Provider/language_provider.dart';
import 'package:best_e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _SettingPageState();
}

class _SettingPageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final isArabic = languageProvider.isArabic;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(S.of(context).languageSettings),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              S.of(context).language,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Color(0XFFff7643),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                title: Text(
                  isArabic ? 'العربية' : 'English',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                trailing: Switch(
                  value: isArabic,
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    final newLocale = value ? Locale('ar') : Locale('en');
                    languageProvider.setLocale(newLocale);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
