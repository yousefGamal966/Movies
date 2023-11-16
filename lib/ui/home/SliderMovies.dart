import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/popular/Results.dart';
import 'package:movies/ui/home/details/DetailsScreen.dart';

import '../../data/api/ApiManager.dart';

class SliderMovies extends StatelessWidget {
   List<Movie>? movie;

   SliderMovies(this.movie,{super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(itemCount:20 , itemBuilder: (context, index, realIndex)
    {
      return GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>  DetailsScreen(movie![index]) ,) );
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: CachedNetworkImage(imageUrl: '${ApiManager.imagePath}${movie![index].posterPath}',
            fit: BoxFit.cover,
              height: 300,
              width: 200,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.amber,),),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )

        // Image.network('${ApiManager.imagePath}${snapshot.data[index].posterPath}',fit: BoxFit.cover,width: 200,height: 300,)
        ),
      );
    }, options:CarouselOptions(
        height: 300,autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.55,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 2)
    ) );
  }
}
