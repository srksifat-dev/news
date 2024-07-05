import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:news/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news/features/daily_news/domain/use_cases/get_article.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies()async{

  // Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(newsApiService: sl()));
  // Use cases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(articleRepository: sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(()=> RemoteArticleBloc(getArticleUseCase: sl()));

}