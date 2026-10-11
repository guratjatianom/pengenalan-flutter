import 'package:flutter/material.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  void _showSnackBar(BuildContext context, String platform) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Media sosial $platform diklik'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.purple),
          onPressed: () => _showSnackBar(context, 'Instagram'),
          tooltip: 'Instagram',
        ),
        IconButton(
          icon: const Icon(Icons.business, color: Colors.blue),
          onPressed: () => _showSnackBar(context, 'LinkedIn'),
          tooltip: 'LinkedIn',
        ),
        IconButton(
          icon: const Icon(Icons.code, color: Colors.black),
          onPressed: () => _showSnackBar(context, 'GitHub'),
          tooltip: 'GitHub',
        ),
      ],
    );
  }
}