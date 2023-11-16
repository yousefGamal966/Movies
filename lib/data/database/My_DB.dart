import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movies/data/model/popular/Results.dart';
import 'package:movies/ui/watchList/WatchListTab.dart';


class MyDB {
  static CollectionReference<Movie> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection(Movie.collectionName)
        .withConverter<Movie>(
        fromFirestore: ((snapshot, options) =>
            Movie.fromFireStore(snapshot.data()!)),
        toFirestore: ((movie, options) => movie.toFireStore()));
  }

  static Future<void> insertMovie(Movie results) {
    CollectionReference<Movie> resultsCollection = getMoviesCollection();
    DocumentReference<Movie> resultsDoc =
    resultsCollection.doc(results.title);
    results.fireId = resultsDoc.id;
    return resultsDoc.set(results);
  }

  static Future<QuerySnapshot<Movie>> getAllMovies() async {
    var querySnapshot = await getMoviesCollection().get();
    return querySnapshot;
  }

  static getMovies() async {
    var querySnapshot = await getMoviesCollection().get();
    var documents = querySnapshot.docs.map((e) => e.data()).toList();
    documents.forEach((element) {
      if (documents.isEmpty) {
        WatchListTab.watchlist = [];
      }
      WatchListTab.watchlist = documents;
    });
  }

  static Stream<QuerySnapshot<Movie>> listenforrealtimeUpdates() {
    return getMoviesCollection().snapshots();
  }

  static Future<void> deletemovie(Movie movie) {
    DocumentReference<Movie> taskdoc =
    getMoviesCollection().doc(movie.title);
    return taskdoc.delete();
  }

  static updatemovie(Movie movie) {
    var taskRef = getMoviesCollection();
    return taskRef
        .doc(movie.title)
        .update({'isadded': movie.isAdded ? false : true});
  }
}
