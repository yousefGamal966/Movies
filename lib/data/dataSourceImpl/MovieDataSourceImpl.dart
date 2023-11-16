import 'package:injectable/injectable.dart';
import 'package:movies/data/api/ApiManager.dart';
import 'package:movies/data/dataSourceContract/MovieDataSource.dart';

import '../model/category/Genres.dart';
import '../model/popular/Results.dart';

@Injectable(as: MovieDataSource)
class MovieDataSourceImpl extends MovieDataSource{
  ApiManager apiManger;
  @factoryMethod
  MovieDataSourceImpl(this.apiManger);
  @override
  Future<List<Movie>?> getPopular() async{
var response = await apiManger.getPopular();
return response;
  }
  @override
  Future<List<Movie>?> getSimilar(int id)async {
    var response = await apiManger.getSimilar(id);
    return response;


  }
  @override
  Future<List<Movie>?> getTopRated()async {
    var response = await apiManger.getTopRated();
    return response;
  }
  @override
  Future<List<Movie>?> getUpComing()async {
    var response = await apiManger.getUpcoming();
    return response;
  }
  @override
  Future<List<Movie>?> search(String search)async {
    var response = await apiManger.search(search);
    return response;


  }
@override
  Future<List<Genres>?> getCategories() async{
    var response = await apiManger.getCategories();
    return response;
  }
  @override
  Future<List<Movie>?> getCategoriesDetails(String genres)async {
    var response = await apiManger.getCategoriesDetails(genres);
  }
}