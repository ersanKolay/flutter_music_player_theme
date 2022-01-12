import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/models/model.dart';
import '/theme/theme.dart';
import '/extensions/theme_x.dart';
import '/ui/single/single_screen.dart';

import 'widgets/genre_list.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  double dragStart = 0;
  double dragChange = 0;
  int currentIndex = 0;
  double pageOffset = 0;
  PageController pageController = PageController(viewportFraction: .7);
  late double scale = 0;
  @override
  void initState() {
    pageController.addListener(() {
      scale = pageController.page!;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final ratio = MediaQuery.of(context).devicePixelRatio;
    final offset = lerpDouble(1, 10, (dragChange / 100))!;
    return Scaffold(
      backgroundColor: MusicPlayerTheme.grayColor,
      appBar: AppBar(
        title: Container(
            height: kToolbarHeight - 20, child: Image.asset('assets/logo.png')),
        automaticallyImplyLeading: false,
        leading: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.ellipsis_vertical,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.profile_circled,
              size: 26,
            ),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() => currentIndex = value);
            },
            physics: const BouncingScrollPhysics(),
            controller: pageController,
            itemCount: Album.albums.length,
            itemBuilder: (context, index) {
              final isSelected = currentIndex == index;
              final album = Album.albums[index];
              return GestureDetector(
                onVerticalDragStart: (details) {
                  dragStart = details.globalPosition.dy;
                },
                onVerticalDragUpdate: (details) {
                  dragChange = ((details.globalPosition.dy - dragStart) * 1.2)
                      .clamp(0, 100);
                  final firePage =
                      ((details.globalPosition.dy - dragStart) * .7)
                          .clamp(0, 100);
                  setState(() {});
                  if (firePage == 100) {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        fullscreenDialog: true,
                        transitionDuration: Duration(milliseconds: 600),
                        pageBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return SingleScreen(
                            album: album,
                            height: height,
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                    /* Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, animation, __) => FadeTransition(
                          opacity: animation,
                          child: SingleScreen(),
                        ),
                      ),
                    ); */
                  }
                },
                onVerticalDragEnd: (details) {
                  setState(() {
                    dragChange = 0;
                    dragStart = 0;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AnimatedContainer(
                    child: Stack(children: [
                      Hero(
                        tag: 'frame' + album.id,
                        child: Material(
                          color: Colors.transparent,
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: Color(0xfffefefe),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            height: 220,
                            width: 220,
                            child: FittedBox(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Transform.scale(
                                  scale: 1 + (scale - index).abs(),
                                  child: Hero(
                                    tag: 'image' + album.id,
                                    child: Image.asset(
                                      'assets/album/${album.albumImage}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Hero(
                            tag: 'singer' + album.id,
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                album.singer,
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Hero(
                            tag: 'albumName' + album.albumName,
                            child: Material(
                              color: Colors.transparent,
                              child: AutoSizeText(
                                album.albumName,
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Icon(CupertinoIcons.music_note_2),
                          SizedBox(height: 8),
                          AutoSizeText(
                            'DRAG TO LISTEN',
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54),
                          ),
                          Icon(CupertinoIcons.chevron_down),
                          SizedBox(height: 8),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 600),
                            height: isSelected ? 30 : 0,
                            child: Image.asset(
                              'assets/3of5.png',
                              width: 300,
                            ),
                          ),
                        ],
                      ),
                    ]),
                    duration: Duration(milliseconds: 600),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                      left: isSelected ? 10 - offset : 10 - offset,
                      right: isSelected ? 10 - offset : 10 - offset,
                      top: isSelected ? (5 + dragChange) : 5 + offset,
                      bottom: isSelected
                          ? ((height * .08 * ratio) - dragChange)
                          : (height * .1 * ratio) - offset,
                    ),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: isSelected ? 10 : 1,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: Color(0xfffefefe)),
                  ),
                ),
              );
            },
          ),
          genreList(height, width, context, dragChange),
        ],
      ),
    );
  }
}
