import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../utils/constants/arch_painter.dart';
import '../../utils/constants/containershape.dart';

class AutoPlayVideoCard extends StatefulWidget {
  final String title;
  final String videoUrl;

  const AutoPlayVideoCard({
    super.key,
    required this.title,
    required this.videoUrl,
  });

  @override
  State<AutoPlayVideoCard> createState() => _AutoPlayVideoCardState();
}

class _AutoPlayVideoCardState extends State<AutoPlayVideoCard> {
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
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: CustomPaint(
            painter:
                ArchBorderPainter(borderColor: Colors.amber, borderWidth: 10),
            child: ClipPath(
              clipper: ArchTopClipper(),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/bridalCollections', 
                  arguments: {
                    'title': widget.title,
                   // 'videoUrl': widget.videoUrl,
                  });
                },
                child: Container(
                  width: 300,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: _controller.value.isInitialized
                      ? Stack(
                          children: [
                            SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: SizedBox(
                                  width: _controller.value.size.width,
                                  height: _controller.value.size.height,
                                  child: VideoPlayer(_controller),
                                ),
                              ),
                            ),
                            // Transparent layer to catch taps
                            Positioned.fill(
                              child: Container(
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ),

        // 🔵 Title
        Positioned(
          top: 420,
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
