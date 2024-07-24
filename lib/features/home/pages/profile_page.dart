import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils.dart';
import '../widgets/tile_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;

  @override
  void initState() {
    super.initState();
    // _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image_path');
    if (imagePath != null) {
      setState(() {
        _image = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    if (!Platform.isIOS) return;

    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File image = File(pickedFile.path);
      final String path = (await getApplicationDocumentsDirectory()).path;
      final String fileName = 'profile_image.jpg';
      final File localImage = await image.copy('$path/$fileName');

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image_path', localImage.path);

      setState(() {
        _image = localImage;
      });
    }
  }

  Future<File?> _getImageFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final imagePath = prefs.getString('profile_image_path');
      if (imagePath != null) {
        final file = File(imagePath);
        if (await file.exists()) {
          return file;
        } else {
          // Если файл не существует, удаляем путь из SharedPreferences
          await prefs.remove('profile_image_path');
        }
      }
    } catch (e) {
      print('Error loading profile image: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    CupertinoButton(
                      onPressed: _pickImage,
                      padding: EdgeInsets.zero,
                      minSize: 28,
                      child: Container(
                        height: 28,
                        width: 58,
                        decoration: BoxDecoration(
                          color: const Color(0xffBAA3E6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Edit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FutureBuilder<File?>(
                  future: _getImageFromCache(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CupertinoActivityIndicator();
                    } else if (snapshot.data != null &&
                        snapshot.data!.existsSync()) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          snapshot.data!,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return SvgPicture.asset(
                        'assets/profile.svg',
                        width: 100,
                        height: 100,
                      );
                    }
                  },
                ),
                const SizedBox(height: 12),
                Text(
                  myname,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Need help?',
            onPressed: () {
              _showHelpDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Need Help?'),
          content: Text(
              'If you have any questions or concerns, please contact us. We will do our best to address your inquiry within 24 hours.'),
          actions: [
            CupertinoDialogAction(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: Text('Contact Us'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SupportScreen(
                        dara: 'https://forms.gle/bm2dmFSYkXVu14wi9'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

class SupportScreen extends StatelessWidget {
  final String dara;

  const SupportScreen({Key? key, required this.dara}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.purple,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(dara)),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            mediaPlaybackRequiresUserGesture: false,
          ),
        ),
      ),
    );
  }
}
