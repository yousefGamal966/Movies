import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/data/model/category/Genres.dart';
import 'package:movies/data/model/popular/Results.dart';
import 'package:movies/repositoryContract/MovieRepositoryContract.dart';
@injectable
class PopularViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  PopularViewModel (this.repository):super(LoadingState('Loading..'));
  void loadPopular()async{
    emit(LoadingState('Loading..'));
    try{
      var popularList = await repository.getPopular();
      emit(SuccessState(moviesList: popularList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class TopRatedViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  TopRatedViewModel (this.repository):super(LoadingState('Loading..'));
  void loadTopRated()async{
    emit(LoadingState('Loading..'));
    try{
      var topRatedList = await repository.getTopRated();
      emit(SuccessState(moviesList: topRatedList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class UpComingViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  UpComingViewModel (this.repository):super(LoadingState('Loading..'));
  void loadUpComing()async{
    emit(LoadingState('Loading..'));
    try{
      var upComingList = await repository.getUpComing();
      emit(SuccessState(moviesList: upComingList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class SimilarViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  SimilarViewModel (this.repository):super(LoadingState('Loading..'));
  void loadSimilar(int id)async{
    emit(LoadingState('Loading..'));
    try{
      var similarList = await repository.getSimilar(id);
      emit(SuccessState(moviesList: similarList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class SearchViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  SearchViewModel (this.repository):super(LoadingState('Loading..'));
  void loadSearch(String? search)async{
    emit(LoadingState('Loading..'));
    try{
      var searchList = await repository.search(search!);
      emit(SuccessState(moviesList: searchList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class CategoryDetailsViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  CategoryDetailsViewModel (this.repository):super(LoadingState('Loading..'));
  void loadCategoryDetails(String genres)async{
    emit(LoadingState('Loading..'));
    try{
      var categoryDetailsList = await repository.getCategoriesDetails(genres);
      emit(SuccessState(moviesList: categoryDetailsList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}
@injectable
class CategoriesViewModel extends Cubit<MovieState>{
  MovieRepositoryContract repository;
  @factoryMethod
  CategoriesViewModel (this.repository):super(LoadingState('Loading..'));
  void loadCategory()async{
    emit(LoadingState('Loading..'));
    try{
      var categoriesList = await repository.getCategories();
      emit(SuccessState(genList: categoriesList));
    }catch(e){
      emit(ErrorState(e.toString()));

    }


  }

}

sealed class MovieState{}
class SuccessState extends MovieState {
  List<Movie>? moviesList;
  List<Genres>? genList;
  SuccessState({this.moviesList,this.genList});
}

class LoadingState extends MovieState {
  String message;
  LoadingState(this.message);
}

class ErrorState extends MovieState {
  String errorMessage;
  ErrorState(this.errorMessage);
}





