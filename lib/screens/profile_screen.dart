import 'package:flutter/material.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info.dart';
import '../widgets/social_media_row.dart';
import '../widgets/action_buttons.dart';
import 'about_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(height: 16),
                    ProfileHeader(
                      name: 'Gurat Jatianom',
                      nim: '25.11.6403',
                    ),
                    SizedBox(height: 16),
                    SocialMediaRow(),
                    SizedBox(height: 16),
                    ProfileInfo(
                      name: 'Gurat Jatianom',
                      nim: '25.11.6403',
                      programStudi: 'S1 Informatika',
                      email: 'g.jatianom@students.amikom.ac.id',
                      lokasi: 'Yogyakarta, Indonesia',
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ActionButtons(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}