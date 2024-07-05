// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:news/features/daily_news/presentation/pages/home/daily_news.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DailyNews.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DailyNews(),
      );
    }
  };
}

/// generated route for
/// [_i1.DailyNews]
class DailyNews extends _i2.PageRouteInfo<void> {
  const DailyNews({List<_i2.PageRouteInfo>? children})
      : super(
          DailyNews.name,
          initialChildren: children,
        );

  static const String name = 'DailyNews';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
