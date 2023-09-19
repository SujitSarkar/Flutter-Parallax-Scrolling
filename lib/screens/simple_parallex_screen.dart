import 'package:flutter/material.dart';

class SimpleParallaxScreen extends StatefulWidget {
  const SimpleParallaxScreen({super.key});

  @override
  State<SimpleParallaxScreen> createState() => _SimpleParallaxScreenState();
}

class _SimpleParallaxScreenState extends State<SimpleParallaxScreen> {
  static const List<String> imageList = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg"
  ];

  late PageController pageController;
  int currentIndex = 0;
  double pageOffset = 0;

  @override
  void initState() {
    pageController =
        PageController(viewportFraction: 0.8, initialPage: currentIndex);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Parallax')),
      body: Center(
        child: SizedBox(
          height: size.height * .6,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              currentIndex = value;
              print(-pageOffset.abs());
            },
            itemCount: imageList.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: currentIndex == index
                    ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4)
                    : const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                    alignment: Alignment(-pageOffset.abs() + index, 0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
