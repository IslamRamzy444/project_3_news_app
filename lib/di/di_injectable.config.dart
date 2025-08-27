// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manager.dart' as _i1047;
import '../data/repository/news/data_sources/local/impl/news_local_data_source_impl.dart'
    as _i393;
import '../data/repository/news/data_sources/local/news_local_data_source.dart'
    as _i851;
import '../data/repository/news/data_sources/remote/impl/news_remote_data_source_impl.dart'
    as _i852;
import '../data/repository/news/data_sources/remote/news_remote_data_source.dart'
    as _i833;
import '../data/repository/news/repository/impl/news_repository_impl.dart'
    as _i1060;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/sources/data_sources/local/impl/source_local_data_source_impl.dart'
    as _i313;
import '../data/repository/sources/data_sources/local/source_local_data_source.dart'
    as _i316;
import '../data/repository/sources/data_sources/remote/impl/source_remote_data_source_impl.dart'
    as _i868;
import '../data/repository/sources/data_sources/remote/source_remote_data_source.dart'
    as _i567;
import '../data/repository/sources/repository/impl/source_repository_impl.dart'
    as _i250;
import '../data/repository/sources/repository/source_repository.dart' as _i522;
import '../ui/home/category_details/news/cubit/news_view_model.dart' as _i686;
import '../ui/home/category_details/source/cubit/sources_view_model.dart'
    as _i728;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i833.NewsRemoteDataSource>(() =>
        _i852.NewsRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i316.SourceLocalDataSource>(
        () => _i313.SourceLocalDataSourceImpl());
    gh.factory<_i851.NewsLocalDataSource>(
        () => _i393.NewsLocalDataSourceImpl());
    gh.factory<_i567.SourceRemoteDataSource>(() =>
        _i868.SourceRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i522.SourceRepository>(() => _i250.SourceRepositoryImpl(
          sourceRemoteDataSource: gh<_i567.SourceRemoteDataSource>(),
          sourceLocalDataSource: gh<_i316.SourceLocalDataSource>(),
        ));
    gh.factory<_i912.NewsRepository>(() => _i1060.NewsRepositoryImpl(
          newsRemoteDataSource: gh<_i833.NewsRemoteDataSource>(),
          newsLocalDataSource: gh<_i851.NewsLocalDataSource>(),
        ));
    gh.factory<_i728.SourcesViewModel>(() =>
        _i728.SourcesViewModel(sourceRepository: gh<_i522.SourceRepository>()));
    gh.factory<_i686.NewsViewModel>(
        () => _i686.NewsViewModel(newsRepository: gh<_i912.NewsRepository>()));
    return this;
  }
}
