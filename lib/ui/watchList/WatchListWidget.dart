import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/popular/Results.dart';
import 'package:movies/ui/watchList/WatchListTab.dart';

import '../../data/api/ApiManager.dart';
import '../../data/database/My_DB.dart';

class WatchListWidget extends StatefulWidget {
  Movie movie;
  WatchListWidget({required this.movie});

  @override
  State<WatchListWidget> createState() => _WatchListWidgetState();
}

class _WatchListWidgetState extends State<WatchListWidget> {
  @override

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Row(
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiManager.imagePath}${widget.movie.posterPath}',
                height: 200,
                width: 130,
                fit: BoxFit.cover,

              ),
              IconButton(
                onPressed: () {
                  if (WatchListTab.watchlist.any(
                          (element) => element.title == widget.movie.title)) {
                    if (WatchListTab.watchlist.length == 1) {
                      MyDB.deletemovie(widget.movie);
                      WatchListTab.watchlist = [];
                    } else {
                      MyDB.deletemovie(widget.movie);
                    }
                  }
                },
                icon: Stack(
                  children: const [
                    Icon(
                      Icons.bookmark_added,
                      color: Colors.amber,
                      size: 40,
                    ),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.movie.title ?? "",
                    style: TextStyle(color: Colors.white)),
                SizedBox(height: 5,),
                Text(
                  widget.movie.releaseDate ?? "",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('${widget.movie.voteAverage}',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
