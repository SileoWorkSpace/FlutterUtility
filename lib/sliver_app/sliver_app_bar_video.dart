import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SliverVideo extends StatefulWidget {
  const SliverVideo({super.key});

  @override
  State<SliverVideo> createState() => _SliverVideoState();
}

class _SliverVideoState extends State<SliverVideo> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/OneCameraFinalVideo.mp4');
    _videoPlayerController!.addListener(() {
      // setState(() {});
    });
    _videoPlayerController!.setLooping(true);
    _videoPlayerController!.initialize().then((_) => setState(() {}));
    _videoPlayerController!.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height * .7,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.loose,
                children: [
                  AspectRatio(
                      aspectRatio: _videoPlayerController!.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController!)),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: AspectRatio(
          //       aspectRatio: _videoPlayerController!.value.aspectRatio,
          //       child: VideoPlayer(_videoPlayerController!)),
          // )
        ],
      ),
    );
  }
}
