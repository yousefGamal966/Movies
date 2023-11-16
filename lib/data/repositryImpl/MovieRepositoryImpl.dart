import 'package:injectable/injectable.dart';
import 'package:movies/data/dataSourceContract/MovieDataSource.dart';
import 'package:movies/repositoryContract/MovieRepositoryContract.dart';

import '../model/category/Genres.dart';
import '../model/popular/Results.dart';

@Injectable(as:MovieRepositoryContract )
class MovieRepositoryImpl extends MovieRepositoryContract {
  MovieDataSource dataSource;
  @factoryMethod
  MovieRepositoryImpl(this.dataSource);
  @override
  Future<List<Movie>?> getPopular() {
   return dataSource.getPopular();
  }
  @override
  Future<List<Movie>?> getSimilar(int id) {
    return dataSource.getSimilar(id);
  }
  @override
  Future<List<Movie>?> getUpComing() {
    return dataSource.getUpComing();
  }
  @override
  Future<List<Movie>?> getTopRated() {
 return dataSource.getTopRated();
  }
  @override
  Future<List<Movie>?> search(String search) {
 return dataSource.search(search);
  }
  @override
  Future<List<Genres>?> getCategories() {
    return dataSource.getCategories();
  }
  @override
  Future<List<Movie>?> getCategoriesDetails(String genres) {
  return dataSource.getCategoriesDetails(genres);
  }
}
