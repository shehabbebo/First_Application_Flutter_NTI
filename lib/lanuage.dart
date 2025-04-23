import 'package:flutter/material.dart';
import 'package:two_day_flutter/utils/App_color.dart';
import 'package:two_day_flutter/utils/string.dart';

class Lanuage_page extends StatefulWidget {
  const Lanuage_page({super.key});

  @override
  State<Lanuage_page> createState() => _Lanuage_pageState();
}

class _Lanuage_pageState extends State<Lanuage_page> {
  String selectedLang = 'EN';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.ScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.ScaffoldBackgroundColor,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.Datails);
              },
            ),
            SizedBox(width: 140),
            Title(
              color: Colors.black,
              child: Text("Settings", style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Language', style: TextStyle(fontSize: 18)),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE0E0E0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [_buildLangButton('AR'), _buildLangButton('EN')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(String lang) {
    bool isSelected = selectedLang == lang;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLang = lang;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          lang,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
