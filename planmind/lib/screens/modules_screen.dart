import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';

class ModulesScreen extends StatefulWidget {
  final List selectedProfessions;
  ModulesScreen({required this.selectedProfessions});
  @override
  _ModulesScreenState createState() => _ModulesScreenState();
}

class _ModulesScreenState extends State<ModulesScreen> {
  List modules = [];
  List picked = [];

  @override
  void initState() {
    super.initState();
    loadModules();
  }

  Future loadModules() async {
    final s = await rootBundle.loadString('assets/data/modules.json');
    setState(() => modules = jsonDecode(s));
  }

  void _save() async {
    var box = Hive.box('planmind_box');
    await box.put('selected_modules', picked);
    await box.put('selected_professions', widget.selectedProfessions);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modül seçimi')),
      body: modules.isEmpty ? Center(child: CircularProgressIndicator()) :
      Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('İlgi alanlarınızı seçin (ödüllü reklam ile premium modüller açılabilir)', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: modules.length,
                itemBuilder: (context, index) {
                  final m = modules[index];
                  final isSel = picked.contains(m['id']);
                  return ListTile(
                    title: Text(m['name_tr'] ?? m['name_en']),
                    subtitle: Text(m['desc_tr'] ?? ''),
                    trailing: Checkbox(
                      value: isSel,
                      onChanged: (v) {
                        setState(() {
                          if (v == true) picked.add(m['id']); else picked.remove(m['id']);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(onPressed: _save, child: Text('Kaydet ve Ana Sayfa')),
          ],
        ),
      ),
    );
  }
}