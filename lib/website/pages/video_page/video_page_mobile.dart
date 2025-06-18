import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constants/arch_painter.dart';
import '../../utils/constants/containershape.dart';

class AutoPlayVideoCardMobile extends StatefulWidget {
  final String title;
  final String videoUrl;

  const AutoPlayVideoCardMobile({
    Key? key,
    required this.title,
    required this.videoUrl,
  }) : super(key: key);

  @override
  State<AutoPlayVideoCardMobile> createState() => _AutoPlayVideoCardMobileState();
}

class _AutoPlayVideoCardMobileState extends State<AutoPlayVideoCardMobile> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.setVolume(0);
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.6;
    const containerHeight = 400.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 12),
        
        // Welcome Tag
            Text(
          'Welcome to SriNivi',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrangeAccent,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 2,
                color: Colors.black26,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),


        const SizedBox(height: 16),

        // Video Container with Arch Border
        CustomPaint(
          painter: ArchBorderPainter(
            borderColor: Colors.amber,
            borderWidth: 6,
          ),
          child: ClipPath(
            clipper: ArchTopClipper(),
            child: GestureDetector(
              onTap: () {
                Get.toNamed('/bridalCollectionsmobile', arguments: {
                  'title': widget.title,
                });
              },
              child: Container(
                width: containerWidth,
                height: containerHeight,
                color: Colors.white,
                child: _controller.value.isInitialized
                    ? FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller.value.size.width,
                          height: _controller.value.size.height,
                          child: VideoPlayer(_controller),
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // Title Below Video
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
