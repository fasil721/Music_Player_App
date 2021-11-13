import 'package:Musify/databases/songs_adapter.dart';
import 'package:Musify/pages/playlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/create_playlist.dart';
import 'favorite_page.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

List<dynamic> allKeys = [];
List<dynamic> playlists = [];

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Your Library",
            style: GoogleFonts.rubik(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (Context) => CreatePlaylist(),
              );
            },
            icon: Icon(
              Icons.add,
              size: 30,
            ),
          ),
          Container(
            width: 12,
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
                bottom: 15,
              ),
              child: ListTile(
                tileColor: Color(0xff4D3C3C),
                onTap: () {
                  // musics.clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FavoritePage(),
                    ),
                  );
                },
                contentPadding: EdgeInsets.symmetric(
                  vertical: 3.0,
                  horizontal: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                title: Text(
                  "Favorites",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.rubik(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     right: 25,
            //     left: 25,
            //     bottom: 15,
            //   ),
            //   child: ListTile(
            //     tileColor: Color(0xff4D3C3C),
            //     onTap: () {
            //       musics.clear();
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => Plalists(),
            //         ),
            //       );
            //     },
            //     contentPadding: EdgeInsets.symmetric(
            //       vertical: 3.0,
            //       horizontal: 16.0,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(5),
            //       ),
            //     ),
            //     leading: Icon(
            //       Icons.queue_music_rounded,
            //       color: Colors.white,
            //       size: 28,
            //     ),
            //     title: Text(
            //       "Playlists",
            //       textAlign: TextAlign.justify,
            //       style: GoogleFonts.rubik(
            //         fontSize: 20,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
            ValueListenableBuilder(
              valueListenable: Hive.box('songs').listenable(),
              builder: (context, Box box, _) {
                allKeys = box.keys.toList();
                allKeys.remove("tracks");
                playlists = allKeys.toList();
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 3.0,
                          horizontal: 16.0,
                        ),
                        tileColor: Color(0xff4D3C3C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlalistView(
                                playlistName: playlists[index],
                              ),
                            ),
                          );
                          print(playlists);
                        },
                        trailing: IconButton(
                          onPressed: () {
                            box.delete(playlists[index]);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        leading: Icon(
                          Icons.queue_music_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        title: Text(
                          playlists[index],
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.rubik(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 15,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
