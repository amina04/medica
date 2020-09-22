import 'package:flutter/material.dart';
import 'package:medica/constantes.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: ClipPath(
              clipper: ClippingClass(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 320.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('images/menu.png'),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Center(
                    child: RotateAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: ["Medica", "Medica"],
                        textStyle: TextStyle(
                          fontSize: 52.0,
                          fontFamily: "Horizon",
                          color: Colors.white,
                          letterSpacing: 5.0,
                        ),
                        textAlign: TextAlign.start,
                       // or Alignment.topLeft
                        ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 270,
              left: 18.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.play_arrow,
                    color: new Color(0xffd60506), size: 40.0),
              )),
        ],
      ),
    );
  }
}


class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
