import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            child: Lottie.asset('assets/animation/file.json',
                width: 300, height: 300)),
        Container(
            child: Text(
          'Aucune image',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        )),
      ],
    );
  }
}
