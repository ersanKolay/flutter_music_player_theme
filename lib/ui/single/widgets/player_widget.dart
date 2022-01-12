import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '/models/model.dart';
import '/theme/theme.dart';
import '/ui/single/widgets/time_slider_widget.dart';

class PlayerWidget extends StatefulWidget {
  final Album album;
  final double height;
  const PlayerWidget({Key? key, required this.album, required this.height})
      : super(key: key);

  @override
  _PlayerWidgetState createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  bool animation = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.height * .01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'singer' + widget.album.singer,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Container(
                      height: widget.height * .05,
                      child: AutoSizeText(
                        widget.album.singer,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: 'albumName' + widget.album.id,
                  child: Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Container(
                        height: widget.height * .06,
                        child: AutoSizeText(
                          widget.album.albumName,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.favorite_outline),
                Container(
                    height: 30,
                    child: Lottie.asset('assets/musicbar.json',
                        animate: animation)),
              ],
            )
          ],
        ),
        SizedBox(height: widget.height * .02),
        TimeSliderWidget(animation: animation),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.loop_rounded,
              size: 36,
            ),
            Icon(
              Icons.fast_rewind_rounded,
              size: 36,
              color: MusicPlayerTheme.grayColor,
            ),
            GestureDetector(
              onTap: () => setState(() => animation = !animation),
              child: Icon(
                animation
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_filled_rounded,
                size: 100,
              ),
            ),
            /* 
            Render alırken sapma yapıyor
            IconButton(
              onPressed: () {
                print('icon');
                setState(() {
                  animation = !animation;
                });
              },
              icon: Icon(
                animation
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_filled_rounded,
                size: 100,
              ),
            ) */
            Icon(
              Icons.fast_forward_rounded,
              size: 36,
              color: MusicPlayerTheme.grayColor,
            ),
            Icon(
              Icons.shuffle_rounded,
              size: 36,
            ),
          ],
        ),
      ],
    );
  }
}
