import 'package:flutter/material.dart';
import '../widgets/tile_button.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Rules',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Play your favorite games and enjoy the gameplay. Here are your favorite games to choose from. Earn coins and bonuses and pass many levels of challenges',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Crazy Frost',
            onPressed: () {
              _showRulesDialog(context, 'Crazy Frost');
            },
          ),
          const SizedBox(height: 16),
          TileButton(
            title: 'Sweet World',
            onPressed: () {
              _showRulesDialog(context, 'Sweet World');
            },
          ),
        ],
      ),
    );
  }

  void _showRulesDialog(BuildContext context, String game) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  game,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  game == 'Crazy Frost'
                      ? 'Crazy Frost is an intellectual quiz that trains your memory. Your task is to score as many points as possible to earn coins. Challenge yourself with various questions and improve your cognitive skills while having fun!'
                      : 'Sweet World is a memory-enhancing game where you need to remember and match pairs of cards. This game is designed to improve your memory skills, concentration, and cognitive abilities. As you play, you\'ll find yourself getting better at recalling patterns and positions. It\'s a fun and engaging way to give your brain a workout!',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                TextButton(
                  child: Text(
                    'Close',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
