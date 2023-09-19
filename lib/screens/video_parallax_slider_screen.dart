import 'package:flutter/material.dart';

import '../widgets/video_card.dart';

class VideoParallaxSliderScreen extends StatefulWidget {
  const VideoParallaxSliderScreen({super.key});

  @override
  State<VideoParallaxSliderScreen> createState() =>
      _VideoParallaxSliderScreenState();
}

class _VideoParallaxSliderScreenState extends State<VideoParallaxSliderScreen> {
  late PageController pageController;
  int selectedIndex = 0;
  static const List<String> onlineVideoList = [
    "assets/videos/video1.mp4",
    "assets/videos/video2.mp4",
    "assets/videos/video3.mp4"
  ];
  @override
  void initState() {
    super.initState();
    pageController =
        PageController(viewportFraction: 0.8, initialPage: selectedIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Video Parallax Slider')),
      body: Column(
        children: [
          SizedBox(
              height: size.height * .7,
              child: PageView.builder(
                onPageChanged: (i) => setState(
                  () => selectedIndex = i,
                ),
                controller: pageController,
                itemCount: onlineVideoList.length,
                itemBuilder: (context, index) => VideoCard(
                  videoLink: onlineVideoList[index],
                  isSelected: selectedIndex == index,
                ),
              ))
        ],
      ),
    );
  }
}
