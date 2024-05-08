import 'package:flutter/material.dart';

class FlagWidget extends StatelessWidget {
  final String flagId;
  const FlagWidget({super.key, required this.flagId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          'https://flagsapi.com/$flagId/flat/64.png',
          height: 20,
          fit: BoxFit.fitWidth,
          width: 32,
        ),
      ),
    );
  }
}
