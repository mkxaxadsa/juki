import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/tile_button.dart';
import 'profile_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});
  void _shareApp() {
    final String shareText =
        "Play Kuji Game - Your gateway to exciting rewards and endless fun! Join me in this thrilling adventure where every play could lead to amazing prizes. Download now and let's embark on this journey together!";
    final String shareUrl = "https://apps.apple.com/es/app/id6572301331";

    Share.share('$shareText\n\n$shareUrl', subject: 'Check out Kuji Game!');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          TileButton(
            title: 'Rate Us',
            onPressed: () {
              InAppReview.instance.openStoreListing(appStoreId: '6572301331');
            },
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Share app',
            onPressed: () {
              _shareApp();
            },
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Privacy Policy',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SupportScreen(
                      dara:
                          'https://docs.google.com/document/d/1e2K_spKwZrjgDETGLcdA3ZTIHrGj0Kh6EHNQQHYFBGE/edit?usp=sharing'),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Terms of Use',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SupportScreen(
                      dara:
                          'https://docs.google.com/document/d/193h_xoLnjRJbf9K9AHd33n5bY7bjwlEb53956Du26pE/edit?usp=sharing'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
