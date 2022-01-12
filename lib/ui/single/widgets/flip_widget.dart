import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/theme/theme.dart';
import '/ui/single/widgets/animation_translate.dart';
import '../../../extensions/theme_x.dart';

class FlipWidget extends StatefulWidget {
  final String albumImage;
  final double size;
  const FlipWidget({Key? key, required this.albumImage, required this.size})
      : super(key: key);

  @override
  _FlipWidgetState createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipWidget> {
  bool isBack = true;
  bool? down;
  double angle = 0;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: angle),
          duration: Duration(seconds: 1),
          builder: (BuildContext context, double val, __) {
            if (val >= (pi / 2)) {
              isBack = false;
            } else {
              isBack = true;
            }
            return (Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(val),
              child: isBack
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image:
                              AssetImage("assets/album/${widget.albumImage}"),
                        ),
                      ),
                    )
                  : ClipRRect(
                      //animasyona ile gelen yazıdaki taşmayı engellemek için sarıldı
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(-pi),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color(0xffe6e7e7),
                          ),
                          child: AnimationTranslate(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Lorem Ipsum Dolor',
                                  style: context.headline1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14.0),
                                  child: AutoSizeText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 30.0,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    _IconCircle(iconData: Icons.send_rounded),
                                    _IconCircle(iconData: Icons.share_rounded),
                                    _IconCircle(
                                        iconData: Icons.headphones_rounded),
                                    _IconCircle(
                                        iconData: Icons.settings_rounded)
                                  ],
                                ),
                                AutoSizeText(
                                  'Rate This Album',
                                  maxLines: 1,
                                  style: context.headline6,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0),
                                  child: Image.asset(
                                    'assets/3of5.png',
                                    width: 300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ));
          }),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData iconData;
  const _IconCircle({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: Icon(iconData, color: Colors.white),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: MusicPlayerTheme.darkColor),
    );
  }
}
