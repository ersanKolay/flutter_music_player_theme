import 'package:flutter/material.dart';

import '../../../extensions/theme_x.dart';
import '/models/model.dart';
import '/theme/theme.dart';

AnimatedPositioned genreList(
    double height, double width, BuildContext context, double dragChange) {
  return AnimatedPositioned(
    duration: kThemeAnimationDuration,
    top: null,
    bottom: 0 - ((height * .3) * (dragChange / 250)),
    child: Container(
      width: width,
      height: width * .3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Genres',
              style:
                  context.headline2.copyWith(color: MusicPlayerTheme.darkColor),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 28,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Category.category.length,
                itemBuilder: (context, i) {
                  final _category = Category.category;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: MusicPlayerTheme.darkColor.withOpacity(.4),
                              width: 2),
                          borderRadius: BorderRadius.circular(20),
                          color: _category[i].selected
                              ? MusicPlayerTheme.darkColor
                              : MusicPlayerTheme.grayColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            _category[i].name,
                            style: context.headline4.copyWith(
                              color: _category[i].selected
                                  ? MusicPlayerTheme.grayColor
                                  : MusicPlayerTheme.darkColor,
                            ),
                          ),
                        )),
                  );
                }),
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
