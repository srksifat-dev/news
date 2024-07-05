import 'dart:io' show HttpStatus;

import 'package:dio/dio.dart';
import 'package:news/core/constants/strings.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news/features/daily_news/domain/repositories/article_repository.dart';

import '../models/article.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;

  ArticleRepositoryImpl({required this.newsApiService});

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try{final httpResponse = await newsApiService.getNewsArticles(
      apiKey: newsApiKey,
      country: countryQuery,
      category: categoryQuery,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(DioException(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioExceptionType.badResponse,
        requestOptions: httpResponse.response.requestOptions,
      ));
    }}on DioException catch (error){
      return DataFailed(error);
    }

  }
}
