import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/locale_provider.dart';
import 'profession_screen.dart';

class LanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProv = Provider.of<LocaleProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('PlanMind')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Dil seçiniz / Choose language', style: TextStyle(fontSize: 18)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                localeProv.setLocale(Locale('tr'));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfessionScreen()));
              },
              child: Text('Türkçe'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                localeProv.setLocale(Locale('en'));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ProfessionScreen()));
              },
              child: Text('English'),
            ),
            SizedBox(height: 24),
            Text('You can change language later in settings.'),
          ],
        ),
      ),
    );
  }
}