import 'package:equatable/equatable.dart';
import 'package:news/features/daily_news/data/models/source.dart';

class ArticleEntity extends Equatable {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  const ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleEntity.fromMap(Map<String, dynamic> map) {
    return ArticleEntity(
      source: map['source'] != null ? Source.fromMap(map['source'] as Map<String,dynamic>) : null,
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      urlToImage: map['urlToImage'] != null ? map['urlToImage'] as String : null,
      publishedAt: map['publishedAt'] != null ? map['publishedAt'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }


  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
    ];
  }
}
