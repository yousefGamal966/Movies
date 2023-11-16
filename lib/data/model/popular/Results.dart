/// adult : false
/// backdrop_path : "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg"
/// genre_ids : [27,9648]
/// id : 507089
/// original_language : "en"
/// original_title : "Five Nights at Freddy's"
/// overview : "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems."
/// popularity : 5818.278
/// poster_path : "/A4j8S6moJS2zNtRR8oWF08gRnL5.jpg"
/// release_date : "2023-10-25"
/// title : "Five Nights at Freddy's"
/// video : false
/// vote_average : 8.378
/// vote_count : 1205

class Movie {
  static const String collectionName = "Movie";
  Movie({
      this.adult, 
      this.backdropPath, 
      this.genreIds,
      this.fireId,
      this.isAdded = false,
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});
  Movie.fromFireStore(Map<String, dynamic> data)
      : this(
    posterPath: data['poster_path'],
    isAdded: data['isAdded'],
    releaseDate: data['release_date'],
    title: data['title'],
    voteAverage: data['vote_average'],
  );
  Map<String, dynamic> toFireStore() {
    final map = <String, dynamic>{};

    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['isAdded'] = isAdded;
    map['title'] = title;
    map['vote_average'] = voteAverage;

    return map;
  }

  Movie.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  bool isAdded = false;
  String? fireId;
  List<num>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage;
  int? voteCount;
Movie copyWith({  bool? adult,
  String? backdropPath,
  List<num>? genreIds,
  int? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  num? popularity,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  num? voteAverage,
  int? voteCount,
}) => Movie(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  genreIds: genreIds ?? this.genreIds,
  id: id ?? this.id,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  releaseDate: releaseDate ?? this.releaseDate,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }

}