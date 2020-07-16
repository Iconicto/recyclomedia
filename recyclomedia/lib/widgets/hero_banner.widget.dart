import 'package:flutter/material.dart';
import 'package:recyclomedia/images.dart';

class HeroBanner extends StatelessWidget {
  final imageURI;
  final child;

  const HeroBanner({Key key, this.imageURI, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Images.urbanGIF,
              fit: BoxFit.cover,
            ),
          ),
          child
        ],
      ),
    );
  }
}
