import 'package:flutter/material.dart';
import 'package:two_day_flutter/utils/string.dart';

class profile_page_item extends StatelessWidget {
  const profile_page_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello!",
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      Text(
                        "shehab",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              _buildOption(
                icon: Icons.person_outline,
                title: 'Update Profile',
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.UpdateProfile);
                },
              ),
              const SizedBox(height: 12),
              _buildOption(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    Routes.ChangePassword,
                  );
                },
              ),
              const SizedBox(height: 12),
              _buildOption(
                icon: Icons.settings_outlined,
                title: 'Settings',
                onTap: () {
                  Navigator.pushReplacementNamed(context, Routes.Lanuage_page);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 24),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: onTap,
      ),
    );
  }
}
