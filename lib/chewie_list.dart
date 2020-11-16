import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:videoplayer/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideosplayerController videosplayerController;
  final bool looping;

  ChewieListItem({
    @required this.videosplayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @voverride
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController=ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16/9,

      autoInitialize: true;
      looping: widget.looping,


      errorBuilder: (context,errorMessage)
      {
        return Center(
          child:Text(
            errorMessage,
            style:TextStyle(color:Colors.white),
          ),// Text
        );//Center
      },
    );
  }

  @override
    Widget build(BuildContext context) {
      return Padding(padding: const EdgeInsets.all(8.0),
              child: Chewie(
                controller: _chewieController,
              ),
      );
    }

  
  @override
  void dispose(){
    super.dispose();

    widget.videosplayerController.dispose();
    _chewieController.dispose();
  }
}
