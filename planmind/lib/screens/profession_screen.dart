import 'dart:convert';
import 'package:flutter/material.dart';
import 'modules_screen.dart';
import 'package:flutter/services.dart' show rootBundle;

class ProfessionScreen extends StatefulWidget {
  @override
  _ProfessionScreenState createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  List professions = [];
  List selected = [];

  @override
  void initState() {
    super.initState();
    loadProfessions();
  }

  Future loadProfessions() async {
    final s = await rootBundle.loadString('assets/data/professions.json');
    setState(() => professions = jsonDecode(s));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meslek seçimi')),
      body: professions.isEmpty ? Center(child: CircularProgressIndicator()) :
      Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text('Mesleğinizi seçin (birden fazla seçebilirsiniz)', style: TextStyle(fontSize: 16)),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: professions.length,
                itemBuilder: (context, index) {
                  final p = professions[index];
                  final isSel = selected.contains(p['id']);
                  return ListTile(
                    title: Text(p['name_tr'] ?? p['name_en']),
                    subtitle: Text(p['desc_tr'] ?? ''),
                    trailing: Checkbox(
                      value: isSel,
                      onChanged: (v) {
                        setState(() {
                          if (v == true) selected.add(p['id']); else selected.remove(p['id']);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ModulesScreen(selectedProfessions: selected)));
              },
              child: Text('Devam'),
            )
          ],
        ),
      ),
    );
  }
}