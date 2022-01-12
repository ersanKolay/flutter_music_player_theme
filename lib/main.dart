import 'package:flutter/material.dart';
import '/theme/theme.dart';

import 'ui/feeds/feed_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MusicPlayerTheme.theme,
      home: FeedScreen(),
    );
  }
}
