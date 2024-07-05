import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/theme/app_theme.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news/injection_container.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async{
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocProvider<RemoteArticleBloc>(
        create: (context)=>sl()..add(GetArticles()),
        child: MaterialApp(
          theme: AppTheme.light,
          home: DailyNews(),
        ),
      ),
    );
  }
}
