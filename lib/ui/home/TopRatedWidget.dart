import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/api/ApiManager.dart';
import '../../data/model/popular/Results.dart';
import 'details/DetailsScreen.dart';

class TopRatedWidget extends StatelessWidget {
 List<Movie>? moviesList;
 int index;
   TopRatedWidget(this.moviesList,this.index,{super.key});

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
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(imageUrl: '${ApiManager.imagePath}${moviesList![index].posterPath}',fit: BoxFit.cover,width:100 ,height: 110,))
          ],
        ) ,
      ),
    );
  }
}
