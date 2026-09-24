import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecetappStrokeIcon extends StatelessWidget {
  const RecetappStrokeIcon({
    super.key,
    required this.asset,
    required this.width,
    required this.height,
    required this.bleed,
  });

  final String asset;
  final double width;
  final double height;
  final Offset bleed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [Positioned(left: -bleed.dx, top: -bleed.dy, child: SvgPicture.asset(asset))],
      ),
    );
  }
}
