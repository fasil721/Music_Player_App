import 'package:Musify/databases/songs_adapter.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class MusicView extends StatefulWidget {
  const MusicView({
    required this.audio,
    Key? key,
  }) : super(key: key);

  final List<Songs> audio;

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer.withId("0");

  Songs find(List<Songs> source, String fromPath) {
    return source.firstWhere((element) => element.uri == fromPath);
  }

  var currentPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image(
              height: 25,
              image: AssetImage("assets/icons/arrow.png"),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image(
              height: 22,
              image: AssetImage("assets/icons/menu.png"),
            ),
          ),
          SizedBox(
            width: 12,
          )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.black,
      body: _assetsAudioPlayer.builderCurrent(
        builder: (BuildContext context, Playing? playing) {
          final myAudio = find(
            widget.audio,
            playing!.audio.assetAudioPath,
          );
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: QueryArtworkWidget(
                    artworkHeight: 300,
                    artworkWidth: 300,
                    id: myAudio.id,
                    nullArtworkWidget: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        height: 300,
                        image: AssetImage("assets/icons/default.jpg"),
                      ),
                    ),
                    type: ArtworkType.AUDIO,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 23,
                    right: 15,
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 16.0,
                    ),
                    title: Text(
                      myAudio.title,
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        myAudio.artist,
                        style: GoogleFonts.rubik(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Image(
                        height: 25,
                        image: AssetImage("assets/icons/heart.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    right: 40,
                    left: 40,
                  ),
                  child: _assetsAudioPlayer.builderRealtimePlayingInfos(
                    builder: (context, RealtimePlayingInfos? infos) {
                      if (infos == null) {
                        return SizedBox();
                      }
                      return Align(
                        alignment: Alignment.bottomCenter,
                        child: ProgressBar(
                          timeLabelPadding: 8,
                          progressBarColor: Colors.white,
                          thumbColor: Colors.white,
                          baseBarColor: Colors.grey,
                          progress: infos.currentPosition,
                          total: infos.duration,
                          timeLabelTextStyle: TextStyle(color: Colors.white),
                          onSeek: (duration) {
                            _assetsAudioPlayer.seek(duration);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              height: 25,
                              image: AssetImage("assets/icons/ishuffle.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/icons/start.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: _assetsAudioPlayer.builderIsPlaying(
                            builder: (context, isPlaying) {
                              return (isPlaying
                                  ? IconButton(
                                      iconSize: 40,
                                      onPressed: () {
                                        _assetsAudioPlayer.playOrPause();
                                      },
                                      icon: Image(
                                        height: 50,
                                        image: AssetImage(
                                            "assets/icons/pause.png"),
                                      ),
                                    )
                                  : IconButton(
                                      iconSize: 40,
                                      onPressed: () {
                                        _assetsAudioPlayer.playOrPause();
                                      },
                                      icon: Image(
                                        height: 50,
                                        image:
                                            AssetImage("assets/icons/play.png"),
                                      ),
                                    ));
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              image: AssetImage("assets/icons/end.png"),
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            icon: Image(
                              height: 25,
                              image: AssetImage("assets/icons/repeat.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
