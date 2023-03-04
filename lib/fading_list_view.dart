import 'package:flutter/material.dart';

class FadingListView extends StatelessWidget {
  final List<Widget> children;

  const FadingListView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
          shaderCallback: (Rect rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.transparent,
                Colors.transparent,
                Colors.black
              ],
              stops: [
                0.0,
                0.1,
                0.9,
                1.0
              ], // 10% purple, 80% transparent, 10% purple
            ).createShader(rect);
          },
          blendMode: BlendMode.dstOut,
          child: ListView(
            children: children,
          )),
    );
  }
}
