import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/data/model/popular/Results.dart';
import 'package:movies/ui/watchList/WatchListWidget.dart';

import '../../data/database/My_DB.dart';

class WatchListTab extends StatelessWidget {
  static List<Movie> watchlist = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            child: Text(
              'Watchlist',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
              child: StreamBuilder<QuerySnapshot<Movie>>(
                stream: MyDB.listenforrealtimeUpdates(),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text(
                          "error Loading data",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Try Again",
                              style: Theme.of(context).textTheme.titleMedium,
                            ))
                      ],
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    var data = snapshot.data!.docs.map((e) => e.data()).toList();

                    return data.isNotEmpty? ListView.separated(
                      physics: BouncingScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(thickness: 1,color: Colors.grey,),
                      itemBuilder: (context, index) {
                        watchlist.add(data[index]);
                        return WatchListWidget(
                          movie: data[index],
                        );
                      },
                      itemCount: data.length,
                    ) :
                    Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_movies,size: 150,color: Colors.grey,),
                        Text('No movies added',
                            style: TextStyle(color: Colors.white)
                        )
                      ],
                    ));
                  }
                }),
              ))
        ],
      ),
    );
  }
}

