import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SingleScreenParallax extends StatefulWidget {
  const SingleScreenParallax({super.key});

  @override
  State<SingleScreenParallax> createState() => _SingleScreenParallaxState();
}

class _SingleScreenParallaxState extends State<SingleScreenParallax> {
  late double offset = 0.0;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) =>
            updateOffsetAccordingToScroll(notification),
        child: Stack(
          children: [
            Positioned(
              top: -.25 * offset,
              child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  height: size.height,
                  width: size.width,
                  fit: BoxFit.cover,
                  image:
                      'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'),
            ),
            SafeArea(
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: size.height * .8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.arrow_circle_up_sharp),
                            Text('Slide to explore')
                          ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool updateOffsetAccordingToScroll(ScrollNotification scrollNotification) {
    setState(() {
      offset = scrollNotification.metrics.pixels;
    });
    return true;
  }
}
