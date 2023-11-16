import 'package:injectable/injectable.dart';

import '../data/model/category/Genres.dart';
import '../data/model/popular/Results.dart';

abstract class MovieRepositoryContract {
  Future<List<Movie>?> getPopular();
  Future<List<Movie>?> getTopRated();
  Future<List<Movie>?> getUpComing();
  Future<List<Movie>?> getSimilar(int id);
  Future<List<Movie>?> search(String search);
  Future<List<Movie>?> getCategoriesDetails(String genres);
  Future<List<Genres>?> getCategories();
}