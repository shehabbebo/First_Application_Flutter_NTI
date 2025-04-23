import 'package:flutter/material.dart';
import 'package:two_day_flutter/core/utils/App_color.dart';
import 'package:two_day_flutter/core/utils/string.dart';

class Lanuage_view extends StatefulWidget {
  const Lanuage_view({super.key});

  @override
  State<Lanuage_view> createState() => _Lanuage_viewState();
}

class _Lanuage_viewState extends State<Lanuage_view> {
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
                Navigator.pushReplacementNamed(context, Routes.Profile_view);
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
