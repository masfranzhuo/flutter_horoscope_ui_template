import 'package:flutter/material.dart';
import 'package:flutter_horoscope_ui_template/src/resources/local_images.dart';

class HomeAppbarBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: ShaderMask(
        shaderCallback: (rectangle) {
          return LinearGradient(
            colors: [Theme.of(context).primaryColor, Colors.transparent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5, 1],
          ).createShader(
            Rect.fromLTRB(0, 0, rectangle.width, rectangle.height),
          );
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          LocalImages.appBarBackground,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
