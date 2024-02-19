import 'package:freezed_annotation/freezed_annotation.dart';
part 'quote.g.dart';
part 'quote.freezed.dart';
@freezed
class Quote with _$Quote {
  const factory Quote({
    required int id,
    required String title,
  }) = _Quote;

  factory Quote.fromJson(Map<String, Object?> json) =>
      _$QuoteFromJson(json);
}