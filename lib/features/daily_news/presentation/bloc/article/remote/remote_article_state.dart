import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable{
  final List<ArticleEntity>? articles;
  final DioException? error;

  RemoteArticleState({this.articles, this.error});

  @override
  List<Object?> get props => [articles, error];
}

class RemoteArticlesLoading extends RemoteArticleState{
  RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState{
  RemoteArticlesDone(List<ArticleEntity> articles) : super(articles: articles);
}

class RemoteArticlesError extends RemoteArticleState{
  RemoteArticlesError(DioException error) : super(error: error);
}