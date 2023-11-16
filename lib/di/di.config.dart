// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/ApiManager.dart' as _i3;
import '../data/dataSourceContract/MovieDataSource.dart' as _i4;
import '../data/dataSourceImpl/MovieDataSourceImpl.dart' as _i5;
import '../data/repositryImpl/MovieRepositoryImpl.dart' as _i7;
import '../repositoryContract/MovieRepositoryContract.dart' as _i6;
import '../ui/home/details/DetailsViewModel.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.MovieDataSource>(
        () => _i5.MovieDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.MovieRepositoryContract>(
        () => _i7.MovieRepositoryImpl(gh<_i4.MovieDataSource>()));
    gh.factory<_i8.PopularViewModel>(
        () => _i8.PopularViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.SearchViewModel>(
        () => _i8.SearchViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.SimilarViewModel>(
        () => _i8.SimilarViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.TopRatedViewModel>(
        () => _i8.TopRatedViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.UpComingViewModel>(
        () => _i8.UpComingViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.CategoriesViewModel>(
        () => _i8.CategoriesViewModel(gh<_i6.MovieRepositoryContract>()));
    gh.factory<_i8.CategoryDetailsViewModel>(
        () => _i8.CategoryDetailsViewModel(gh<_i6.MovieRepositoryContract>()));
    return this;
  }
}
