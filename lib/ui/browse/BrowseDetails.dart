import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/api/ApiManager.dart';
import 'package:movies/data/model/category/Genres.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/browse/BrowseDetailsWidget.dart';
import 'package:movies/ui/home/details/DetailsViewModel.dart';

import '../../data/model/popular/Results.dart';

class BrowseDetails extends StatefulWidget {
  Genres genres;

  BrowseDetails(this.genres);

  @override
  State<BrowseDetails> createState() => _BrowseDetailsState();
}

class _BrowseDetailsState extends State<BrowseDetails> {
  var browseListViewModel = getIt.get<CategoryDetailsViewModel>();
  @override
  void initState() {
    print(widget.genres.id);
   browseListViewModel.loadCategoryDetails('${widget.genres.id}');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.genres.name}',style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF282A28),
      ),
      body: Column(
        children: [

          Expanded(
            child:
            FutureBuilder(
              future: ApiManager().getCategoriesDetails('${widget.genres.id}'), builder: (context, snapshot) {
                if (snapshot.data == null){
                  return Center(child: CircularProgressIndicator(color: Colors.amber,),);
                }
                return ListView.builder(itemBuilder:(context, index) {
                  return BrowseDetailsWidget(snapshot.data, index);

                },itemCount: snapshot.data!.length,);


            },)
            // BlocBuilder<CategoryDetailsViewModel,MovieState>(
            //   bloc: browseListViewModel,
            //   builder: (context, state) {
            //     print(widget.genres.name);
            //     print('------------------------------------------');
            //     print('------------------------------------------');
            //     switch (state){
            //       case SuccessState():{
            //         var moviesList = state.moviesList;
            //         print(moviesList);
            //         print('------------------------------------------');
            //
            //         return ListView.separated(
            //             separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
            //             itemBuilder: (context, index) {
            //               return Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //
            //                   Row(
            //                     children: [
            //                       BrowseDetailsWidget(moviesList!, index),
            //                       Column(
            //                         children: [
            //                           Text("${moviesList![index].title}",style: TextStyle(color: Colors.white),),
            //                           Text("${moviesList[index].releaseDate}",style: TextStyle(color: Colors.white),),
            //                           Row(
            //                             children: [
            //                               Icon(Icons.star,color: Colors.amber,),
            //                               Text("${moviesList[index].voteAverage}",style: TextStyle(color: Colors.white),),
            //                             ],
            //                           ),
            //
            //                         ],
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               );
            //
            //             },
            //             itemCount: 20
            //         );
            //       }
            //       case LoadingState ():{
            //         return Center(child:CircularProgressIndicator(color: Colors.amber,) ,);
            //       }
            //       case ErrorState():{
            //         return Center(child: ElevatedButton(onPressed: (){}, child: Text('Try Again')),);
            //       }
            //     }
            //
            //   },),
          ),
        ],
      ),
    );
  }
}
