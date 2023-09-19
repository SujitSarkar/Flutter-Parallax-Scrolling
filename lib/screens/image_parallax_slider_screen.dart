import 'package:flutter/material.dart';

import '../widgets/image_card.dart';

class ImageParallaxSliderScreen extends StatefulWidget {
  const ImageParallaxSliderScreen({super.key});

  @override
  State<ImageParallaxSliderScreen> createState() =>
      _ImageParallaxSliderScreenState();
}

class _ImageParallaxSliderScreenState extends State<ImageParallaxSliderScreen> {
  late PageController pageController;
  int selectedIndex = 2;
  // late Timer timer;
  static const List<String> imageList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg"
  ];
  @override
  void initState() {
    super.initState();
    pageController =
        PageController(viewportFraction: 0.8, initialPage: selectedIndex);

    // timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (selectedIndex <= onlineVideoList.length) {
    //     selectedIndex++;
    //   } else {
    //     selectedIndex = 0;
    //   }\
    //   if (pageController.hasClients) {
    //     pageController.animateToPage(
    //       selectedIndex,
    //       duration: const Duration(milliseconds: 1500),
    //       curve: Curves.easeIn,
    //     );
    //   }
    // });
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
      appBar: AppBar(title: const Text('Image Parallax Slider')),
      body: Center(
        child: SizedBox(
          height: size.height * .7,
          child: PageView.builder(
            onPageChanged: (i) => setState(() => selectedIndex = i),
            controller: pageController,
            itemCount: imageList.length,
            itemBuilder: (context, index) => ImageCard(
              imageLink: imageList[index],
              isSelected: selectedIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
