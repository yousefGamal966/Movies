import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';

import 'package:movies/ui/home/SliderMovies.dart';
import 'package:movies/ui/home/TopRatedWidget.dart';
import 'package:movies/ui/home/UpcomingWidget.dart';
import 'package:movies/ui/home/details/DetailsViewModel.dart';

import '../../data/api/ApiManager.dart';
import '../../data/model/popular/Results.dart';

class HomeTab extends StatefulWidget {

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var popularViewModel = getIt.get<PopularViewModel>();
  var topRatedViewModel = getIt.get<TopRatedViewModel>();
  var upComingViewModel = getIt.get<UpComingViewModel>();
  void initState() {
    popularViewModel.loadPopular();
    topRatedViewModel.loadTopRated();
    upComingViewModel.loadUpComing();



    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(

        children: [
          SizedBox(height: 20,),


          Column(
            children: [
              BlocBuilder<PopularViewModel,MovieState>(
                bloc: popularViewModel,
                builder: (context, state) {
                  switch (state){
                    case SuccessState():{
                      var moviesList = state.moviesList;
                      return SliderMovies(moviesList);
                    }
                    case LoadingState ():{
                      return Center(child:CircularProgressIndicator(color: Colors.amber,) ,);
                    }
                    case ErrorState():{
                      return Center(child: ElevatedButton(onPressed: (){}, child: Text('Try Again')),);
                    }
                  }

              },),
              // FutureBuilder(future: ApiManager().getPopular(), builder:(context, snapshot) {
              //   if(snapshot.connectionState == ConnectionState.waiting){
              //     return Center(child: CircularProgressIndicator(color: Colors.amber,),);
              //   }else if(snapshot.hasError||snapshot.error == 'error'){
              //     return Center(
              //       child: Column(
              //         children: [
              //           Text('Error'),
              //         ],
              //       ),
              //     );
              //   }
              //   return SliderMovies(snapshot);
              //
              // },),
              Card(
                color: Color(0xFF282A28),
                child: Column(
                  children: [
                    Text('New Releases',style: TextStyle(
                      color: Colors.white
                    ),),
                    Container(


                      width:MediaQuery.of(context).size.width*0.97 ,
                      height: 150,
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                      child:BlocBuilder<UpComingViewModel,MovieState>(
                        bloc: upComingViewModel,
                        builder: (context, state) {
                          switch (state){
                            case SuccessState():{
                              var moviesList = state.moviesList;
                              return ListView.separated(scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
                                  itemBuilder: (context, index) =>UpcomingWidget(moviesList, index),

                                  itemCount: 20
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

                      // FutureBuilder(
                      // future:ApiManager().getUpcoming() ,
                      //     builder:(context, snapshot) {
                      //       if(snapshot.connectionState == ConnectionState.waiting){
                      //         return Center(child: CircularProgressIndicator(color: Colors.amber),);
                      //       }else if(snapshot.hasError||snapshot.error == 'error'){
                      //         return Center(
                      //           child: Column(
                      //             children: [
                      //               Text('Error'),
                      //             ],
                      //           ),
                      //         );
                      //       }
                      //
                      //       return ListView.separated(scrollDirection: Axis.horizontal,
                      //         separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
                      //         itemBuilder: (context, index) =>UpcomingWidget(snapshot, index),
                      //
                      //         itemCount: 20
                      //       );
                      //     },
                      // )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),

              Card(
                color: Color(0xFF282A28),
                child: Column(
                  children: [
                    const Text('Recomended',style: TextStyle(
                        color: Colors.white
                    ),),
                    Container(


                        width:MediaQuery.of(context).size.width*0.97 ,
                        height: 210,
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
                        child:BlocBuilder<TopRatedViewModel,MovieState>(
                          bloc: topRatedViewModel,
                          builder: (context, state) {
                            switch (state){
                              case SuccessState():{
                                var moviesList = state.moviesList;
                                return  ListView.separated(scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        color: Color(0xFF514F4F),

                                        child: Column(
                                          children: [
                                            TopRatedWidget(moviesList, index),
                                            Row(
                                              children: [
                                                Icon(Icons.star,color: Colors.amber,),
                                                Text('${moviesList![index].voteAverage}',style: TextStyle(
                                                    color: Colors.white
                                                ),),
                                              ],
                                            ),
                                            Container(
                                              alignment: Alignment.center,

                                              width: 110,
                                              child: Text('${moviesList![index].title}',style: TextStyle(
                                                  color: Colors.white,fontSize: 10
                                              ),),
                                            ),
                                          ],
                                        ),
                                      );

                                    },
                                    itemCount: 20
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

                        // FutureBuilder(
                        //   future:ApiManager().getTopRated() ,
                        //   builder:(context, snapshot) {
                        //     if(snapshot.connectionState == ConnectionState.waiting){
                        //       return Center(child: CircularProgressIndicator(color: Colors.amber),);
                        //     }else if(snapshot.hasError||snapshot.error == 'error'){
                        //       return Center(
                        //         child: Column(
                        //           children: [
                        //             Text('Error'),
                        //           ],
                        //         ),
                        //       );
                        //     }
                        //
                        //     return ListView.separated(scrollDirection: Axis.horizontal,
                        //         separatorBuilder: (context, index) =>Container(width: 3,color: Color(0xFF282A28),) ,
                        //         itemBuilder: (context, index) {
                        //           return Card(
                        //             color: Color(0xFF514F4F),
                        //
                        //             child: Column(
                        //               children: [
                        //                 TopRatedWidget(snapshot, index),
                        //                 Row(
                        //                   children: [
                        //                     Icon(Icons.star,color: Colors.amber,),
                        //                     Text('${snapshot.data?[index].voteAverage}',style: TextStyle(
                        //                       color: Colors.white
                        //                     ),),
                        //                   ],
                        //                 ),
                        //                 Container(
                        //                   alignment: Alignment.center,
                        //
                        //                   width: 110,
                        //                   child: Text('${snapshot.data?[index].title}',style: TextStyle(
                        //                       color: Colors.white,fontSize: 10
                        //                   ),),
                        //                 ),
                        //               ],
                        //             ),
                        //           );
                        //
                        //         },
                        //         itemCount: 20
                        //     );
                        //   },
                        // )
                    ),
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget Data (String imageName,int index){
    return Image.asset(imageName);
  }
}

