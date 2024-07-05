import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news/features/daily_news/presentation/widgets/article_tile.dart';

import '../../../domain/entities/article.dart';

@RoutePage()
class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "Daily News",
    ),

    actions: [
      GestureDetector(
        onTap: () => _onShowSavedArticlesViewTapped(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.bookmark, color: Colors.black),
        ),
      ),
    ],
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticlesDone) {
        return ListView.separated(
          itemBuilder: (context, index) => ArticleTile(
            article: state.articles![index],
            onArticlePressed: (article)=> _onArticlePressed(context,article),
          ),
          separatorBuilder: (_, __) => const SizedBox(
            height: 8,
          ),
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    },
  );
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SavedArticles');
}
