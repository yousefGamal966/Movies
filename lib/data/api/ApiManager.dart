
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:injectable/injectable.dart';
import 'package:movies/data/model/category/CategoryResponse.dart';
import 'package:movies/data/model/category/Genres.dart';

import '../model/popular/Results.dart';
@singleton
class ApiManager{
  ///3/movie/popular
static const String baseUrl = 'api.themoviedb.org';
static const String apiKey = '9601f2e01613dfd33b94240fe32a438f';
static const String imagePath = 'https://image.tmdb.org/t/p/original';
static const String accessToken = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NjAxZjJlMDE2MTNkZmQzM2I5NDI0MGZlMzJhNDM4ZiIsInN1YiI6IjY1MzkyYmFhMGZiMTdmMDBhYmMxM2U3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2nM2VIgjayAGuBc_ShTGm2BoE_2fmsDtDa50C8eG-3k';
 Future<List<Movie>>getPopular()async{
  var url = Uri.https(baseUrl,'3/movie/popular',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey
  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Movie>>getUpcoming()async{
  var url = Uri.https(baseUrl,'3/movie/upcoming',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey
  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Movie>>getTopRated()async{
  var url = Uri.https(baseUrl,'3/movie/top_rated',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey
  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Movie>>getCategoriesDetails(String genres)async{
  var url = Uri.https(baseUrl,'3/discover/movie',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey,
    'with_genres':genres,
  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Movie>>search(String search)async{
  var url = Uri.https(baseUrl,'3/search/movie',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey,
    'query':search
  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Movie>>getSimilar(int id)async{
  var url =  Uri.https(baseUrl,'3/movie/$id/similar',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey,

  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['results'] as List;
  var  results = json.map((movie) =>Movie.fromJson(movie)).toList();
  return results;


}
 Future<List<Genres>>getCategories()async{
  var url =  Uri.https(baseUrl,'3/genre/movie/list',{
    'accept':'application/json',
    'Authorization': accessToken,
    'api_key':apiKey,

  });
  var response = await http.get(url);
  var json = jsonDecode(response.body)['genres'] as List ;
  var  results = json.map((movie) =>Genres.fromJson(movie)).toList();
  return results;



}



}