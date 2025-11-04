import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localeProv = Provider.of<LocaleProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Ayarlar')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('Dil'),
              subtitle: Text(localeProv.locale?.languageCode ?? 'Cihaz dili'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Tema'),
              subtitle: Text('Sistem teması ile uyumlu'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}