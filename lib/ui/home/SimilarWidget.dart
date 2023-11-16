import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/popular/Results.dart';

import '../../data/api/ApiManager.dart';
import 'details/DetailsScreen.dart';

class SimilarWidget extends StatelessWidget {
  List<Movie>? moviesList;
  int index;
  SimilarWidget(this.moviesList,this.index,{super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  DetailsScreen(moviesList![index]) ,) );
      },
      child: Container(
        padding:EdgeInsets.symmetric(vertical: 8,horizontal: 3),
        child:Column(
          children: [
            CachedNetworkImage(imageUrl: '${ApiManager.imagePath}${moviesList![index].posterPath}',fit: BoxFit.cover,width:100 ,height: 110,),

          ],
        ) ,
      ),
    );
  }
}
