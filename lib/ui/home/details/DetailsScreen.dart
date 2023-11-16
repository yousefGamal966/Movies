import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/home/SimilarWidget.dart';
import 'package:movies/ui/home/TopRatedWidget.dart';
import 'package:movies/ui/home/details/DetailsViewModel.dart';
import 'package:movies/ui/watchList/WatchListTab.dart';

import '../../../data/api/ApiManager.dart';
import '../../../data/database/My_DB.dart';
import '../../../data/model/popular/Results.dart';


class DetailsScreen extends StatefulWidget {
  Movie movie;
  bool pressed = false;
  DetailsScreen(this.movie);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool bookMarked = true;
  var similarViewModel = getIt.get<SimilarViewModel>();
  @override
  void initState() {

    similarViewModel.loadSimilar(widget.movie.id!);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.movie.title ?? '',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF282A28),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: '${ApiManager.imagePath}${widget.movie.posterPath}',
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(widget.movie.title??'',style: TextStyle(color: Colors.white,fontSize: 18),),
              Text("${widget.movie.releaseDate??''} ",style: TextStyle(color: Colors.grey,fontSize: 10),),
              Row(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: '${ApiManager.imagePath}${widget.movie.posterPath}',
                        height: 200,
                        width: 130,

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
                          } else {
                            MyDB.insertMovie(widget.movie);
                          }

                          widget.pressed = !widget.pressed;
                          widget.movie.isAdded = true;

                          setState(() {
                            MyDB.getMovies();

                          });
                        },
                        icon: Stack(
                          children: [
                            Icon(
                              widget.pressed||widget.movie.isAdded == true?
                              Icons.bookmark_added
                              :Icons.bookmark,


                              color:
                              widget.pressed||widget.movie.isAdded == true ? Colors.amber : Colors.grey,
                              size: 40,
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('${widget.movie.voteAverage}',style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        Text(widget.movie.overview??'',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  )
                ],
              ),
              Card(
                color: Color(0xFF282A28),
                child: Column(
                  children: [
                    Text('More Like This',style: TextStyle(
                        color: Colors.white
                    ),),
                    Container(


                        width:MediaQuery.of(context).size.width*0.97 ,
                        height: 150,
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                        child:BlocBuilder<SimilarViewModel,MovieState>(
                          bloc: similarViewModel,
                          builder: (context, state) {
                            switch (state){
                              case SuccessState():{
                                var moviesList = state.moviesList;
                                return  ListView.separated(scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
                                    itemBuilder: (context, index) {

                                        return SimilarWidget(moviesList, index);},

                                    itemCount: moviesList!.length
                                );
                              }
                              case LoadingState ():{
                                return Center(child:CircularProgressIndicator(color: Colors.amber,) ,);
                              }
                              case ErrorState():{
                                return Center(child: ElevatedButton(onPressed: (){}, child: Text('Try Again')),);
                              }
                            }

                          },),


                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
