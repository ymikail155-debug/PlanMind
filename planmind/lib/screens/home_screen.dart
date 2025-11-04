import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box? box;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    box = Hive.box('planmind_box');
    MobileAds.instance.initialize();
    _bannerAd = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedModules = box?.get('selected_modules') ?? [];
    return Scaffold(
      appBar: AppBar(title: Text('PlanMind')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Hoş geldiniz!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('Seçilen modüller: ${selectedModules.join(', ')}'),
            SizedBox(height: 20),
            Expanded(child: Center(child: Text('Modüller burada görünecek'))),
            if (_bannerAd != null)
              Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              ),
          ],
        ),
      ),
    );
  }
}