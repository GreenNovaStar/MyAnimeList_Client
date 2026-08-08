import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:android_app/data/model/node.dart';

part 'author.freezed.dart';
part 'author.g.dart';

/// A manga author entry: a person node plus their role (e.g. "Story", "Art").
@freezed
abstract class Author with _$Author {
  const factory Author({Node? node, String? role}) = _Author;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}
