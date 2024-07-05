
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/core/resources/data_state.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

import '../../../../domain/use_cases/get_article.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState>{

  final GetArticleUseCase getArticleUseCase;
  RemoteArticleBloc({required this.getArticleUseCase}) : super(RemoteArticlesLoading()){
   on<GetArticles>(onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit)async{
final dataState = await getArticleUseCase();

if(dataState  is DataSuccess && dataState.data!.isNotEmpty){
  emit(
    RemoteArticlesDone(dataState.data!)
  );
}

if(dataState is DataFailed){
  emit(
    RemoteArticlesError(dataState.error!)
  );
}
  }

}