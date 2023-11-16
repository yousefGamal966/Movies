import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/data/model/category/CategoryResponse.dart';
import 'package:movies/di/di.dart';
import 'package:movies/ui/browse/BrowseDetails.dart';
import 'package:movies/ui/browse/BrowseWidget.dart';
import 'package:movies/ui/home/details/DetailsViewModel.dart';

import '../../data/api/ApiManager.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
 var  categoryViewModel = getIt.get<CategoriesViewModel>();
  @override
  void initState() {
categoryViewModel.loadCategory();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<CategoriesViewModel,MovieState>(
            bloc: categoryViewModel,
            builder: (context, state) {
              switch (state){
                case SuccessState():{
                  var genList = state.genList;
                  return Expanded(
                    child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:10,
              mainAxisSpacing:20
              ) , itemBuilder: (context, index) {
              print(genList[index].name);
              return InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>  BrowseDetails(genList[index]) ,) );
                },
              child: BrowseWidget(genList,index)
              );


              },itemCount: genList!.length,),
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
        ],
      ),
    );
  }
}
