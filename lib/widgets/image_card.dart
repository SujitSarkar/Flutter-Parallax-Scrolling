import 'package:flutter/material.dart';
import 'package:flutter_parallax_scrolling/widgets/parallax_flow_delegete.dart';

class ImageCard extends StatelessWidget {
  ImageCard({
    super.key,
    required this.imageLink,
    required this.isSelected,
  });

  final String imageLink;
  final bool isSelected;
  final GlobalKey videoKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: isSelected
          ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4)
          : const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 6),
              blurRadius: 8),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: videoKey,
          ),
          children: [
            Image.asset(imageLink, fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }
}

// class ImageCard extends StatefulWidget {
//   const ImageCard({
//     super.key,
//     required this.imageLink,
//     required this.isSelected,
//   });

//   final String imageLink;
//   final bool isSelected;

//   @override
//   State<ImageCard> createState() => _ImageCardState();
// }

// class _ImageCardState extends State<ImageCard> {
//   final GlobalKey videoKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 250),
//       margin: widget.isSelected
//           ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4)
//           : const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withOpacity(0.3),
//               offset: const Offset(0, 6),
//               blurRadius: 8),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Flow(
//           delegate: ParallaxFlowDelegate(
//             scrollable: Scrollable.of(context),
//             listItemContext: context,
//             backgroundImageKey: videoKey,
//           ),
//           children: [
//             Image.asset(widget.imageLink, fit: BoxFit.fitWidth),
//           ],
//         ),
//       ),
//     );
//   }
// }
