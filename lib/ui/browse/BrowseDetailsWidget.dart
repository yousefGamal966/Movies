import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/api/ApiManager.dart';
import '../../data/model/popular/Results.dart';
import '../home/details/DetailsScreen.dart';

class BrowseDetailsWidget extends StatelessWidget {
  List<Movie>? moviesList;
  int index;

  BrowseDetailsWidget(this.moviesList,this.index);


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
            Card(
              color: Color(0xFF282A28),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(imageUrl: '${ApiManager.imagePath}${moviesList![index].posterPath}',fit: BoxFit.cover,width:100 ,height: 110,)),
                  Expanded(child: Text('${moviesList![index].title}',style: TextStyle(color: Colors.white),)),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.amber,),
                      Text('${moviesList![index].voteAverage}',style: TextStyle(color: Colors.white),)
                    ],
                  )

                ],
              ),
            )
          ],
        ) ,
      ),
    );
  }
}
