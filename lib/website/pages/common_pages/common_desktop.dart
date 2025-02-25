import 'package:flutter/material.dart';
import 'package:profinix_app/website/widgets/basewidgets.dart';

class CommonDesktop extends StatefulWidget {
  final String s1, s2, s3, image;
  final bool imageLeft;
  final bool addData;

  const CommonDesktop({
    Key? key,
    required this.s1,
    required this.s2,
    required this.s3,
    required this.image,
    required this.imageLeft,
    this.addData = false,
  }) : super(key: key);

  @override
  _CommonDesktopState createState() => _CommonDesktopState();
}

class _CommonDesktopState extends State<CommonDesktop>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _containerAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _containerAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Trigger the animation after the first frame render
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SlideTransition(
          position: _containerAnimation,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image section (left)
              if (widget.imageLeft) _buildImageSection(),
              if (widget.imageLeft) const SizedBox(width: 25),

              // Text section
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // crossAxisAlignment: widget.imageLeft
                  //     ? CrossAxisAlignment.end
                  //     : CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   widget.s1.toUpperCase(),
                    //   textAlign: TextAlign.center,
                    //   style: const TextStyle(
                    //     color: Colors.pink,
                    //     fontSize: 25,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    Text(
                      widget.s2,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.s3,
                      textAlign: TextAlign.center,
                      // textAlign:
                      //     widget.imageLeft ? TextAlign.right : TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        height: 1.3,
                      ),
                    ),
                    // if (widget.addData) _buildBulletPointsSection(),
                  ],
                ),
              ),
              // Space between text and image
              if (!widget.imageLeft)
                const SizedBox(width: 20), // Adjust width as needed

              // Image section (right)
              if (!widget.imageLeft) _buildImageSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Flexible(
      flex: 2,
      child: Container(
        height: 430,
        decoration: BoxDecoration(
          //border: Border.all(color: Colors.pink, width: 2),
          borderRadius: BorderRadius.circular(20),
          image: widget.image.isNotEmpty
              ? DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                )
              : null,
        ),
      ),
    );
  }
}
