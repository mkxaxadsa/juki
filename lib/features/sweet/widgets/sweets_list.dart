import 'package:flutter/material.dart';

import '../../../core/models/sweet.dart';
import 'sweet_button.dart';

class SweetsList extends StatelessWidget {
  const SweetsList({
    super.key,
    required this.sweets,
  });

  final List<Sweet> sweets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[0]),
            SweetButton(sweets[1]),
            SweetButton(sweets[2]),
            SweetButton(sweets[3]),
            SweetButton(sweets[4]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[5]),
            SweetButton(sweets[6]),
            SweetButton(sweets[7]),
            SweetButton(sweets[8]),
            SweetButton(sweets[9]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[10]),
            SweetButton(sweets[11]),
            SweetButton(sweets[12]),
            SweetButton(sweets[13]),
            SweetButton(sweets[14]),
          ],
        ),

        // 2
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[15]),
            SweetButton(sweets[16]),
            SweetButton(sweets[17]),
            SweetButton(sweets[18]),
            SweetButton(sweets[19]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[20]),
            SweetButton(sweets[21]),
            SweetButton(sweets[22]),
            SweetButton(sweets[23]),
            SweetButton(sweets[24]),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SweetButton(sweets[25]),
            SweetButton(sweets[26]),
            SweetButton(sweets[27]),
            SweetButton(sweets[28]),
            SweetButton(sweets[29]),
          ],
        ),
      ],
    );
  }
}
