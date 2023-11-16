import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/home/details/DetailsViewModel.dart';
import 'package:movies/ui/search/SearchWidget.dart';

import '../../data/api/ApiManager.dart';

class SearchTab extends StatefulWidget {

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController searchController = TextEditingController();
  bool search = false;
  var searchViewModel = getIt.get<SearchViewModel>();
  @override
  void initState() {

    searchViewModel.loadSearch(searchController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: [
            TextField(
              controller: searchController,
              onChanged: (value){
                setState(() {
                searchViewModel.loadSearch(searchController.text);
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 5,horizontal: 10
                ),

                suffixIconColor: Colors.white,
                fillColor: Color(0xFF514F4F),
                filled: true,
                focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent,width: 0)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.transparent,width:0 )
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)
                    ),
                    borderSide: BorderSide(
                        color: Colors.transparent,width: 0
                    )
                ),
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.white),


                suffixIcon:IconButton(onPressed: (){
                  setState(() {
                      searchViewModel.loadSearch(searchController.text);
                  });
                },icon: Icon(Icons.search)),
              ),


            ),
            Expanded(
              child: Container(
                child: BlocBuilder<SearchViewModel,MovieState>(
                  bloc: searchViewModel,
                  builder: (context, state) {
                    if(searchController.text == ''){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_movies,color: Colors.grey,size: 120,),
                          Text('Not Found',style: TextStyle(color: Colors.grey),)
                        ],
                      );
                    }
                    switch (state){
                      case SuccessState():{
                        var moviesList = state.moviesList;
                       return ListView.builder(itemBuilder: (context, index) {

                    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                    Row(
                    children: [
                    SearchWidget(moviesList, index),
                    Expanded(
                      child: Column(
                      children: [
                      Text("${moviesList[index].title}",style: TextStyle(color: Colors.white),),
                      Text("${moviesList[index].releaseDate}",style: TextStyle(color: Colors.white),),
                      Row(
                      children: [
                      Icon(Icons.star,color: Colors.amber,),
                      Text("${moviesList[index].voteAverage}",style: TextStyle(color: Colors.white),),
                      ],
                      ),

                      ],
                      ),
                    )
                    ],
                    ),
                    ],
                    );

                    },
                         itemCount: moviesList!.length,

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
            )
          ],
        ),
      ),
    );
  }
}
